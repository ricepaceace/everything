#pragma once
#include "constants.h"
#include "detections.h"
#include "countpeaks.h"

short ldata[PARAM_LEARN_SIZE];
char thresholded[PARAM_LEARN_SIZE];
short rising_edges[MAX_EDGES];
short falling_edges[MAX_EDGES];

struct thresholds
{
	short low_threshold;
	short high_threshold;
};

static struct thresholds BinarySearch(short* data, short data_len, short minlen);

// When it returns, the data is negated or not to match the thresholds it returns
static struct thresholds TryPlusMinus(short v_or_a_length, int *multiplier) // return whether or not we multiplied it as well
{ 
  
	struct thresholds o_cutoffs = BinarySearch(ldata, PARAM_LEARN_SIZE, v_or_a_length);
	short i;
  	for (i = 0; i < PARAM_LEARN_SIZE; i++)
  	{
    	ldata[i] *= -1;
    }
  
  	struct thresholds o_cutoffs_neg = BinarySearch(ldata, PARAM_LEARN_SIZE, v_or_a_length);

    Serial.println("ocutoff high");
    Serial.println(o_cutoffs_neg.high_threshold);
    Serial.println("ocutoff low");
    Serial.println(o_cutoffs_neg.low_threshold);
  	if (o_cutoffs_neg.high_threshold - o_cutoffs_neg.low_threshold < o_cutoffs.high_threshold - o_cutoffs.low_threshold)
  	{
		// original data was correct, so un-negate the data
		for (i = 0; i < PARAM_LEARN_SIZE; i++)
		{
			ldata[i] *= -1;
		}
    	*multiplier = 1;
    	return o_cutoffs;
  	}
  	else
  	{
    	*multiplier = -1;
    	return o_cutoffs_neg;
  	}
}

params GuessParameters2(const short* data)
{ 
	params learned_params;
	int i, j;
  	for (i = 0; i < PARAM_LEARN_SIZE; i++)
  	{
    	ldata[i] = pgm_read_word_near(data + i);
  	}


  	int v_flip;
  	struct thresholds v_cutoffs = TryPlusMinus(V_LENGTH, &v_flip);

  	learned_params.v_thresh = (int)(v_cutoffs.low_threshold/2 + v_cutoffs.high_threshold/2); //.5*v_cutoffs[1] + .5*v_cutoffs[2]
  	learned_params.v_flip = v_flip;


  	// ldata already has the vflip multiplied in at this point
  	for (i = 0; i < PARAM_LEARN_SIZE; i++)
    	thresholded[i] = ldata[i] > learned_params.v_thresh;

  	short n_edges = CountPeaks(thresholded, V_LENGTH, rising_edges, falling_edges, PARAM_LEARN_SIZE, MAX_EDGES);
  	for (i = 0; i < n_edges && rising_edges[i] != -1; i++)
  	{
    	short start_idx = max(rising_edges[i] - T_BLANK, 0);
    	short end_idx = min(falling_edges[i] + L_BLANK, PARAM_LEARN_SIZE - 1);
    	for (j = start_idx; j <= end_idx; j++)
      	ldata[j] = 0;
  	}


  	int a_flip;
 	struct thresholds a_cutoffs = TryPlusMinus(A_LENGTH, &a_flip);
  	// a_flip is relative to v_flip at this point. Make it absolute
  	a_flip *= v_flip;
    Serial.println("a low threshold");
    Serial.println(a_cutoffs.low_threshold);
    Serial.println("a high threshold");
    Serial.println(a_cutoffs.high_threshold);
  	learned_params.a_thresh = (int)((a_cutoffs.low_threshold * 7 + a_cutoffs.high_threshold * 3)/10);
  	learned_params.a_flip = a_flip;

   return learned_params;
}

short ths[N_BS_PTS];
short beats[N_BS_PTS];
short derivs[N_BS_PTS-1];

struct thresholds NO_TH_FOUND = {-1, -1};

struct flat { short start_index; short data_len;};

// Computes the thresholds that correspond to a flat piece on the graph of threshold and counted peaks
// data should be of the specified length 
// minlen is the minimum length to call a peak (where this notion is a bit fuzzy and you should see CountPeaks for the exact definition)

static struct thresholds BinarySearch(short* data, short data_len, short minlen) {
  short min_beats = data_len / MINHEARTRATE_DIV_SAMPLRATE60;
  short max_beats = data_len / MAXHEARTRATE_DIV_SAMPLERATE60;
  
  Serial.print("valid beat counts: [");
  Serial.print(min_beats);
  Serial.print(", ");
  Serial.print(max_beats);
  Serial.println("]");
  
	short min_th = 0, max_th = 0, k, i,j;
 
	for (k = 0; k < data_len; k++)
	{
		max_th = max(max_th, data[k]);
	}
   /*
	short next_max_th = max_th;

	for (i = 4; i >= 2; i /= 2)
	{
		short th = max_th / i;
		for (k = 0; k < data_len; k++)
		{
			thresholded[k] = data[k] > th;
		}

		short beats = CountPeaks(thresholded, minlen, rising_edges, falling_edges, PARAM_LEARN_SIZE, MAX_EDGES);
    Serial.println("Beats when first determining max Thresh");
    Serial.println(beats);
		if (beats < min_beats)
		{
			next_max_th = max_th;
		}
	}

	max_th = next_max_th;*/

  	for (i = 0; i < NUM_RECURSIVE_SUBDIV; i++)
  	{
      Serial.print("i ");
      Serial.println(i);
      Serial.print("max_th ");
      Serial.println(max_th);
      Serial.print("min_th ");
      Serial.println(min_th);
      
    	// ths = linspace(min_th, max_th, npts);
    	short delta = (max_th - min_th)/(N_BS_PTS - 1);
    	short last = min_th;
    	// rounding??
    	for (k = 0; k < N_BS_PTS; k++)
    	{
    	  	ths[k] = last;
      		last += delta;
    	}

		for (j = 0; j < N_BS_PTS; j++)
		{
			for (k = 0; k < data_len; k++)
			{
				thresholded[k] = data[k] > ths[j];
			}
			beats[j] = CountPeaks(thresholded, minlen, rising_edges, falling_edges, PARAM_LEARN_SIZE, MAX_EDGES); 
			Serial.print(j);
			Serial.print(": Trying threshold ");
			Serial.print(ths[j]);
			Serial.print(". Got beats: ");
			Serial.println(beats[j]);
      
		}

		// both indices are inclusive
		short first_valid = 0;
		while (first_valid < N_BS_PTS && beats[first_valid] > max_beats)
			first_valid++;
      
		short last_valid = N_BS_PTS - 1;
		while (last_valid >= 0 && beats[last_valid] < min_beats)
			last_valid--;
     
    Serial.print("first_valid ");
    Serial.println(first_valid);
    Serial.print("last_valid ");
    Serial.println(last_valid);
    
		if (first_valid > last_valid)
      {
      Serial.println("No Threshold found");
			return NO_TH_FOUND;
      }
    
		short minderiv = -1;
		short minderiv_idx = -1;

		if (first_valid == last_valid)
			minderiv_idx = first_valid;

		for (j = first_valid; j < last_valid; j++)
		{
		  	derivs[j] = abs(beats[j+1] - beats[j]);
		  	if (minderiv_idx == -1 || derivs[j] < minderiv)
		  	{
		    	minderiv = derivs[j];
		    	minderiv_idx = j;
		  	}
		}

#if DEBUG
   for(j = first_valid; j < last_valid; j++)
   {
        Serial.println(derivs[j]);
   }
   Serial.println("derivs");
		Serial.print("On recursive iteration ");
		Serial.print((int)i);
		Serial.print(". Min derivative was ");
		Serial.println(minderiv);
#endif

    	short nmin, nmax; // The index of the new min, max thresholds (inclusive)
    	if (minderiv == 0)
    	{
      		struct flat current = {-1, -1};
      		struct flat best = {-1, -1};
      		for (j = first_valid; j < last_valid; j++)
      		{
        		if (derivs[j] == 0)
        		{
          			if (current.start_index == -1)
          			{
            			current.start_index = j;
            			current.data_len = 0;
          			}
          			current.data_len++;
          			if (current.data_len > best.data_len)
            			best = current;
    			  }
        		else
        		{
         	 		current.start_index = -1;
          	  current.data_len = -1;
    			  }
  			  }
          Serial.print("best indices: ");
          Serial.print(best.start_index);

          Serial.print(" to ");
		  // Technically, the end of the best index is start + len - 1, but since these are derivative indices,
		  // it makes more sense to print start + len
          Serial.println(best.start_index + best.data_len);
          
      		nmin = best.start_index - 1;
      		nmax = best.start_index + best.data_len;
    	}
		else
    	{
      		nmin = minderiv_idx - 1;
      		nmax = minderiv_idx + 1;
		  }
    	// make sure they are in bounds
    	if (nmin < 0)
      		nmin = 0;
    	if (nmax > N_BS_PTS - 1)
      		nmax = N_BS_PTS - 1;

      Serial.print("nmin ");
      Serial.println(nmin);
      Serial.print("nmax ");
      Serial.println(nmax);
      
    	min_th = ths[nmin];
    	max_th = ths[nmax];

    	if (beats[nmin] == beats[nmax])
      		break;

  	}
  	struct thresholds toreturn =  {min_th, max_th};
  	return toreturn;
}

