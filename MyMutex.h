#pragma once
#include<iostream>
#include<pthread.h>
#include<unistd.h>


/*
互斥信号量与临界资源类似
互斥信号量的使用步骤
pthread_mutex_init(&mutex,NULL); /init mutex variable/
pthread_mutex_destroy(&mutex); /destory mutex variable/
pthread_mutex_lock(&mutex);
pthread_mutex_unlock(&mutex);
pthread_mutex_trylock (&mutex)
*/

namespace my{
class MyMutex{
public:
    MyMutex();
    ~MyMutex();
    void lock();
    void unlock();
private:
    pthread_mutex_t mutex_;
};
}

