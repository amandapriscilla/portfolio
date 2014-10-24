#ifndef _CUSTOMER_H_
#define _CUSTOMER_H_
#include "LinkedList.h"

class Customer
{
    public:
    int arrivingTime;
    Customer(){ arrivingTime = 0; }
    Customer(int time){ arrivingTime = time; }
    int getWaitingTime(int time){ return time - arrivingTime; }
};


#endif // CUSTOMER_h
