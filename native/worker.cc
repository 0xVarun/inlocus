#include "worker.h"
#include <stdio.h>


void Worker::Execute() {
	printf("In Execute\n");
}

void Worker::HandleOKCallback() {
	Nan::HandleScope scope;
	auto x = Nan::New(7);

	v8::Local<v8::Value> argv[] = { Nan::Undefined(), x };
	this->mCallback->Call(2, argv);
}