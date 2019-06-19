#include <node.h>
#include <nan.h>
#include <stdio.h>
#include <iostream>
#include <string>
#include <vector>

#include "worker.h"

namespace inlocus {

	using v8::FunctionCallbackInfo;
	using v8::Isolate;
	using v8::Local;
	using v8::NewStringType;
	using v8::Object;
	using v8::String;
	using v8::Value;

	void Method(const v8::FunctionCallbackInfo<v8::Value>& args) {
		v8::Isolate* isolate = args.GetIsolate();
		std::vector<int> v;
		v.push_back(2);
		auto callback = new Nan::Callback(args[1].As<v8::Function>());
		Nan::AsyncQueueWorker(new Worker(v, callback));
		std::cout << (args[0]->IsArray() ? "true" : "false") << std::endl;
	}

	void Initialize(Local<Object> exports) {
	  NODE_SET_METHOD(exports, "sort", Method);
	}

	NODE_MODULE(sort, Initialize);

}