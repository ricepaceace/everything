short ldata[PARAM_LEARN_SIZE];
char thresholded[PARAM_LEARN_SIZE];
short rising_edges[MAX_EDGES];
short falling_edges[MAX_EDGES];

struct thresholds { short low_threshold; short high_threshold;};

static struct thresholds BinarySearch(short* data, short length, short minlen);
// When it returns, the data is negated or not to match the thresholds it returns
static struct thresholds TryPlusMinus(short v_or_a_length, byte* multiplier) { // return whether or not we multiplied it as well
  struct thresholds o_cutoffs = BinarySearch(ldata, PARAM_LEARN_SIZE, v_or_a_length);

  for (short i = 0; i < PARAM_LEARN_SIZE; i++)
    ldata[i] *= -1;
  struct thresholds o_cutoffs_neg = BinarySearch(ldata, PARAM_LEARN_SIZE, v_or_a_length);

  if (o_cutoffs_neg.high_threshold - o_cutoffs_neg.low_threshold < o_cutoffs.high_threshold - o_cutoffs.low_threshold) {
    // original data was correct, so un-negate the data
    for (short i = 0; i < PARAM_LEARN_SIZE; i++)
      ldata[i] *= -1;
    *multiplier = 1;
    return o_cutoffs;
  }
  else {
    *multiplier = -1;
    return o_cutoffs_neg;
  }
}

void GuessParameters2() { 
  for (int i = 0; i < PARAM_LEARN_SIZE; i++) {
    ldata[i] = pgm_read_word_near(data + i);
  }


  byte v_flip;
  struct thresholds v_cutoffs = TryPlusMinus(V_LENGTH, &v_flip);

  learned_params.v_thresh = v_cutoffs.low_threshold/2 + v_cutoffs.high_threshold/2; //.5*v_cutoffs[1] + .5*v_cutoffs[2] 
  learned_params.vflip = v_flip;


  // ldata already has the vflip multiplied in at this point
  for (short i = 0; i < PARAM_LEARN_SIZE; i++)
    thresholded[i] = ldata[i] > learned_params.v_thresh;

  short n_edges = CountPeaks(thresholded, V_LENGTH, rising_edges, falling_edges, PARAM_LEARN_SIZE, MAX_EDGES);
  for (short peak = 0; peak < n_edges && rising_edges[peak] != -1; peak++)
  {
    short start_idx = max(rising_edges[peak] - T_BLANK, 0);
    short end_idx = min(falling_edges[peak] + L_BLANK, PARAM_LEARN_SIZE - 1);
    for (short j = start_idx; j <= end_idx; j++)
      ldata[j] = 0;
  }


  byte a_flip;
  struct thresholds a_cutoffs = TryPlusMinus(A_LENGTH, &a_flip);
  // a_flip is relative to v_flip at this point. Make it absolute
  a_flip *= v_flip;
  learned_params.a_thresh = (a_cutoffs.low_threshold * 7 + a_cutoffs.high_threshold * 3)/10;
  learned_params.aflip = a_flip;
}

short ths[N_BS_PTS];
short beats[N_BS_PTS];
short derivs[N_BS_PTS-1];

struct thresholds NO_TH_FOUND = {-1, -1};

struct flat { short start_index; short length;};

// Computes the thresholds that correspond to a flat piece on the graph of threshold and counted peaks
// data should be of the specified length 
// minlen is the minimum length to call a peak (where this notion is a bit fuzzy and you should see CountPeaks for the exact definition)
static struct thresholds BinarySearch(short* data, short length, short minlen) {
  short min_beats = length * MIN_HEARTRATE / (SAMPLE_RATE * 60);
  short max_beats = length * MAX_HEARTRATE / (SAMPLE_RATE * 60);

  short min_th = 0, max_th = 0;
  for (short k = 0; k < length; k++)
  {
    max_th = max(max_th, data[k]);
  }
  short next_max_th = max_th;
  for (byte i = 4; i >= 2; i /= 2)
  {
    short th = max_th / i;
    for (short k = 0; k < length; k++)
    {
      thresholded[k] = data[k] > th;
    }

    short beats = CountPeaks(thresholded, minlen, rising_edges, falling_edges, PARAM_LEARN_SIZE, MAX_EDGES);
    if (beats < min_beats)
      next_max_th = max_th;
  }
  max_th = next_max_th;



  for (byte i = 0; i < NUM_RECURSIVE_SUBDIV; i++)
  {

    // ths = linspace(min_th, max_th, npts);
    short delta = (max_th - min_th)/(N_BS_PTS - 1);
    short last = min_th;
    // rounding??
    for (int i = 0; i < N_BS_PTS; i++)
    {
      ths[i] = last;
      last += delta;
    }

    for (short j = 0; j < N_BS_PTS; j++)
    {
      for (short k = 0; k < length; k++)
      {
        thresholded[k] = data[k] > ths[j];
      }
      beats[j] = CountPeaks(thresholded, minlen, rising_edges, falling_edges, PARAM_LEARN_SIZE, MAX_EDGES);
    }
    // both indices are inclusive
    short first_valid = 0;
    while (first_valid < N_BS_PTS && ths[first_valid] < min_beats)
      first_valid++;
    short last_valid = N_BS_PTS - 1;
    while (last_valid >= 0 && ths[last_valid] > max_beats)
      last_valid++;

    if (first_valid > last_valid)
      return NO_TH_FOUND;


    short minderiv = -1;
    short minderiv_idx = -1;

    if (first_valid == last_valid)
      minderiv_idx = first_valid;

    for (short j = first_valid; j < last_valid; j++)
    {
      derivs[j] = abs(beats[j+1] - beats[j]);
      if (minderiv_idx == -1 || derivs[j] < minderiv)
      {
        minderiv = derivs[j];
        minderiv_idx = j;
      }
    }
#if DEBUG
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
      for (short j = first_valid; j < last_valid; j++)
      {
        if (derivs[j] == 0)
        {
          if (current.start_index == -1)
          {
            current.start_index = j;
            current.length = 0;
          }
          current.length++;
          if (current.length > best.length)
            current = best;
        }
        else
        {
          current.start_index = -1;
          current.length = -1;
        }
      }
      nmin = best.start_index - 1;
      nmax = best.start_index + best.length;
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

    min_th = ths[nmin];
    max_th = ths[nmax];

    if (beats[nmin] == beats[nmax])
      break;

  }
  struct thresholds toreturn =  {min_th, max_th};
  return toreturn;
}

