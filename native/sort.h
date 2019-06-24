#ifndef __INLOUCS_SORT_H
#define __INLOUCS_SORT_H

#include <node.h>

class Sort {
public:
	Sort();
	~Sort();

	void SortAsc(v8::Local<v8::Object> obj);
};


#endif // __INLOUCS_SORT_H