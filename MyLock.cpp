#include "MyLock.h"
namespace my{


MyLock::MyLock(MyMutex& m):mymutex_(m){
    mymutex_.lock();
}

MyLock::~MyLock(){
    mymutex_.unlock();
}


}