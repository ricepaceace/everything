#pragma once
template<typename T, int maxsize>
struct CircularBuffer {
	int sum;
	T data[maxsize];
	int head_i; // Index where the next value goes
	int len;
	int capacity;
	CircularBuffer() 
		: sum(0), head_i(0), len(0), capacity(maxsize) {
	}
	// adds a value and removes one if necessary
	void push(T val) {
		if (len == capacity) {
			sum -= tail();
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
		if (len == capacity)
			return tail();
		else
			return 0;
	}
	// 0 <= newsize <= maxsize
	void resize(int newsize) {
		// shrinking, but we haven't even filled that much up.
		// This is the easy case, the general case handles it though
		/* if (newsize <= capacity && len <= newsize) {
			capacity = newsize;
			return;
		} */

		if (newsize < capacity) // shrinking
			while (len > newsize)
				pop();
		// Technically, we haven't lost all those old elements because we're using the full storage space of the circular buffer even when capacity < maxsize, so we could probably re-add them, but I think zero-filling makes more sense, in which case we don't need to do anything.
		capacity = newsize;
	}
};



