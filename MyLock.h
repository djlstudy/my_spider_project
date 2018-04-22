#pragma once
#include"MyMutex.h"
namespace my{
class MyLock{
public:
    MyLock(MyMutex& m);
    ~MyLock();
private:
    MyMutex mymutex_;
};
}