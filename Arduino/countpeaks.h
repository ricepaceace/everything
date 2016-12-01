#pragma once


// th_data: 1 if data[i] > current threshold
// fills in rising_edges and falling_edges with the indices of the edge
// The same number of elements should be set in both arrays, and it should be the value that is returned unless there are some peaks that are way too big.
// Unset elements will have value -1.
short CountPeaks(char* th_data, short min_length, short* rising_edges, short* falling_edges, short length_data, short max_edges)
{
  short currentState = 0;
  short risingIndex = 0;
  short fallingIndex = 0;
  short peaks = 0;
  for (short k = 0; k < MAX_EDGES; k++) {
    rising_edges[k] = -1;
    falling_edges[k] = -1;
  }

  for(short i = 0; i < length_data; i++)
  {
    short acc = 0;
    
    for ( short j=max(0, i - length_data); j <= i && acc <= min_length/ INVERSE_FILTER_THRESHOLD; j++)
      acc += th_data[j] ? 1 : 0;
    boolean isHigh = acc > min_length/INVERSE_FILTER_THRESHOLD;
    if (isHigh && !currentState && risingIndex < MAX_EDGES)
      //rising edge
      rising_edges[risingIndex++] = i;
    if (!isHigh && currentState && fallingIndex < MAX_EDGES) {
      // falling edge
      falling_edges[fallingIndex++] = i;
      peaks++;
      peaks += (falling_edges[fallingIndex - 1] - rising_edges[risingIndex - 1])/SAMPLES_PER_ADDTL_HEARTBEAT;
    }

    currentState = isHigh;

  }
  return peaks;
}
