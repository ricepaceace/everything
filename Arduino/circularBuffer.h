#pragma once
template<typename T, int maxsize>
struct CircularBuffer {
	int sum;
	T data[maxsize];
	int head_i;
	int len;
	CircularBuffer() 
		: sum(0), head_i(0), len(0) {
	}
	// adds a value and removes one if necessary
	void push(T val) {
		if (len == maxsize) {
			sum -= data[head_i];
			len--;
		}
		data[head_i] = val;
		sum += val;
		len++;
		head_i++;
		if (head_i == maxsize)
			head_i = 0;
	}
	T pop() {
		T toReturn = tail();
		sum -= toReturn;
		len--;
		return toReturn;
	}
	// returns the most recently added element
	T head() { 
		if (len == 0)
			return 0;
		int i = head_i - 1;
		if (i < 0)
			i += maxsize;
		return data[i];
	}
	// returns the oldest element still in the circular buffer
	T tail() {
		if (len == 0)
			return 0;
		int i = head_i - len;
		if (i < 0)
			i += maxsize;
		return data[i];
	}

	// Returns the element that is exactly maxsize back from the current one or 0 if there isn't an element.
	// It's the same as tail() when the buffer is full and returns 0 when it's not.
	T ftail() {
		if (len == maxsize)
			return data[head_i];
		else
			return 0;
	}
};



