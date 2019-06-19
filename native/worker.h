#ifndef _INLOCUS_WORKER_H
#define _INLOCUS_WORKER_H

#include <nan.h>
#include <vector>


class Worker : public Nan::AsyncWorker {
private:
	std::vector<int> json;
	Nan::Callback *mCallback;
public:
	Worker(std::vector<int> v, Nan::Callback *callbck) : Nan::AsyncWorker(callbck), json(v), mCallback(callbck) {}
	~Worker() { delete mCallback; }

	void Execute(); // Non JS Worker Thread
	void HandleOKCallback(); // JS thread
};


#endif // _INLOCUS_WORKER_H