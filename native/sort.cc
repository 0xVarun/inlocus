#include "sort.h"
#include <iostream>
#include <string>
#include <time.h>
#include <v8.h>
#include <vector>

Sort::Sort() { std::cout << "Sort()" << std::endl; }

void Sort::SortAsc(v8::Isolate *isolate, v8::Local<v8::Object> obj) {
  v8::Local<v8::Array> props = obj->GetPropertyNames();

  int year, month, day;

  for (unsigned int i = 0; i < props->Length(); i++) {
    v8::Local<v8::Object> innerObj = obj->Get(props->Get(i))->ToObject();
    v8::Local<v8::Array> innerProps = innerObj->GetPropertyNames();
    for (unsigned int j = 0; j < innerProps->Length(); j++) {
      std::string prop = *v8::String::Utf8Value(innerProps->Get(j)->ToString());
      int cmp = prop.compare("createdAt");
      if (cmp == 0) {
        std::string createdAt = *v8::String::Utf8Value(
            innerObj->Get(innerProps->Get(j))->ToString());
        size_t Tposition = createdAt.find("T");
        if (Tposition == std::string::npos) {
          isolate->ThrowException(v8::Exception::TypeError(
              v8::String::NewFromUtf8(isolate, "Invalid Date Format")));
          return;
        }
        std::string createdDate = createdAt.substr(0, Tposition);
        // 2019-04-30
        size_t yearPosition = createdDate.find("-");
        if (yearPosition == std::string::npos) {
          isolate->ThrowException(v8::Exception::TypeError(
              v8::String::NewFromUtf8(isolate, "Error Parsing Year")));
          return;
        }
        year = std::stoi(createdDate.substr(0, yearPosition));
        
        size_t monthPosition = createdDate.find("-", yearPosition);
        if (monthPosition == std::string::npos) {
          isolate->ThrowException(v8::Exception::TypeError(
              v8::String::NewFromUtf8(isolate, "Error Parsing Month")));
          return;
        }

        month = std::stoi(createdDate.substr(yearPosition+1, monthPosition));

        size_t dayPosition = createdDate.find("-", monthPosition);
        if (dayPosition == std::string::npos) {
          isolate->ThrowException(v8::Exception::TypeError(
              v8::String::NewFromUtf8(isolate, "Error Parsing day")));
          return;
        }

        day = std::stoi(createdDate.substr(monthPosition+1, dayPosition));
        

        std::cout << yearPosition << "\t" << monthPosition << "\t" << dayPosition << std::endl;

        std::cout 
        << year 
        << "-"
        << month
        << "-"
        << day 
        << std::endl;
      }
    }
    std::cout << "\n";
  }
}

Sort::~Sort() { std::cout << "~Sort()" << std::endl; }
