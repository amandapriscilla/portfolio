#ifndef _CACHIER_H_
#define _CACHIER_H_

#include "LinkedList.h"
#include "Customer.h"
#include "Util.h"

class Cashier
{
    public:
    int busyTime; // atendendo cliente
    Customer *currentCustomer;
    LinkedList<Customer*> *customersLine;
    int getLineSize(){ return customersLine->getSize(); }
    Customer *getFirstCustomer(){ return customersLine->getFirst()->getValue(); }
    Cashier(){ customersLine = new LinkedList<Customer*>(); busyTime = 0; currentCustomer = NULL; }
    bool processCashier(int cashierTime)
    {
        if (busyTime == 0)
        {
            if (currentCustomer != NULL){
                delete(currentCustomer);
                currentCustomer = NULL;
            }
            if (customersLine->getSize() > 0){
                currentCustomer = customersLine->getFirst()->getValue();
                customersLine->remove(currentCustomer);
                busyTime = cashierTime;
                return true;
            }
        } else busyTime--;
        return false;
    }


};

#endif // CACHIER_H
