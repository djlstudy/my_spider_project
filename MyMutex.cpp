#include "MyMutex.h"
#include<errno.h>

/*

pthread_mutex_init(&mutex,NULL); /init mutex variable/
pthread_mutex_destroy(&mutex); /destory mutex variable/
pthread_mutex_lock(&mutex);
pthread_mutex_unlock(&mutex);
pthread_mutex_trylock (&mutex)
*/

namespace my{

MyMutex::MyMutex(){
    if(!pthread_mutex_init(&mutex_,NULL)){
        std::cout<<"init mutex failed! errno:"<<errno<<std::endl;
        return;
    }
   

}
void MyMutex::lock(){
     pthread_mutex_lock(&mutex_);
}

void MyMutex::unlock(){
     pthread_mutex_unlock(&mutex_);
}


MyMutex::~MyMutex(){
    
    pthread_mutex_destroy(&mutex_);
}


}

