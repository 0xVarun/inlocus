#include <node.h>
#include <v8.h>
#include <iostream>
#include "sort.h"

void Method(const v8::FunctionCallbackInfo<v8::Value>& args) {
	v8::Isolate *isolate = args.GetIsolate();
	if(!args[0]->IsObject() && !args[0]->IsArray()) {
		isolate->ThrowException(v8::Exception::TypeError(v8::String::NewFromUtf8(isolate, "First argument needs to be an object")));
		args.GetReturnValue().SetUndefined();
		return;
	} else {
		Sort *sort = new Sort();
		sort->SortAsc(args[0]->ToObject());
		delete sort;
	}
}

void init(v8::Local<v8::Object> exports) {
	NODE_SET_METHOD(exports, "inloucs", Method);
}


NODE_MODULE(inloucs, init);

