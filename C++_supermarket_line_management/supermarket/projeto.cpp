#include <stdio.h>
#include <iostream>
#include "Cachier.h"
#include "Customer.h"
#include "LinkedList.h"
#include "Util.h"
using std::cout;
using std::cin;
using std::endl;
using std::string;
using std::ifstream;
using std::stringstream;






class Application
{
    public:
    LinkedList<Cashier*> *cashierList;
    Util *util;

    Application(Util *util){ cashierList = new LinkedList<Cashier*>(); this->util = util; }

    Cashier * getAvailableCashier(int maxWait)
    {
        Node<Cashier*> *node = this->cashierList->getFirst();
        while(node != NULL)
        {
            Cashier *c = node->getValue();
            if (c->busyTime < maxWait && c->customersLine->getSize() == 0)
            {
                return c;
            }
            node = node->getNext();
        }
        return NULL;
    }


    void printStatus()
    {
        cout << "STATUS: ";
        util->printTime();
        Node<Cashier*> *node = this->cashierList->getFirst();
        int i = 1;
        while(node != NULL)
        {
            Cashier *c = node->getValue();
            cout << "C" << i++ << "[" << c->busyTime << "] -> ";
            Node<Customer*> *node_cust = c->customersLine->getFirst();
            while(node_cust != NULL)
            {
                Customer * cust = node_cust->getValue();
                cout << "(" << cust->getWaitingTime(util->time) << ") ";
                node_cust = node_cust->getNext();
            }

            cout << endl;

            node = node->getNext();


        }
    }

    void changePeriod(int period_index, int minFlow, int maxFlow){
             // CHANGE PERIOD POINT
            if (period_index < 6)
            {
                if (util->time == util->period[period_index+1]*3600)
                {

                    // GET RESULTS
                    util->maxCashiers[period_index] = cashierList->getSize();
                    cout << "END OF PERIOD: MAX TOTAL OF CASHIERS = " << this->cashierList->getSize() << endl;

                    period_index++;

                    cout << "NEW PERIOD: ";
                    util->printTime();

                    minFlow = util->minPeopleFlow[period_index];
                    maxFlow = util->maxPeopleFlow[period_index];
                    cout << "NEW FLOW IS FROM " << minFlow << " TO " << maxFlow <<endl;;
                    // CLOSE EMPTY CASHIERS

                    Node<Cashier*> *node = this->cashierList->getFirst();
                    while(node != NULL)
                    {
                        Cashier *cashier = node->getValue();
                        if (cashier->customersLine->getSize() == 0)
                        {
                            delete(cashier->customersLine);
                            delete(cashier->currentCustomer);
                            node = node->getNext();
                            this->cashierList->remove(cashier);
                            cout << "Closing an empty cashier!" << endl;
                        }
                        else { node = node->getNext(); }
                    } // End
                    system("pause");

                }

            } // END CHANGE PERIOD POINT


    } // END CHANGEPERIOD()

    void run()
    {
        int period_index = 0; // 0 a 6
        // Use util->max/minPeopleFlow
        int minFlow = util->minPeopleFlow[period_index];
        int maxFlow = util->maxPeopleFlow[period_index];
        cout << "NEW FLOW IS FROM " << minFlow << " TO " << maxFlow <<endl;

        int timeNextCustomer = util->getRand(minFlow, maxFlow);
        cout <<"First curstomer arrives in " << util->getMinute(timeNextCustomer) << "min and " << util->getSeconds(timeNextCustomer)<< " seconds" << endl;

        while(util->time <= 24 * 3600)
        {
            this->changePeriod(period_index, minFlow, maxFlow);




            int rand = util->getRand(util->minTimeAtCashier, util->maxTimeAtCachier);

            // CHECK ARRIVING CUSTOMER
            if(timeNextCustomer == 0)
            {
                // NEW CUSTOMER ARRIVE AT THE TIME CURRENT
                cout << "New Customer Arrived at "<< util->getHour(util->time) << ":" <<util->getMinute(util->time) <<"!" << endl;
                Customer *customer = new Customer(util->time);

                if (cashierList->getSize() == 0) // First cashier
                {
                    Cashier *cashier = new Cashier();
                    this->cashierList->insert(cashier);
                    cashier->customersLine->insert(customer);
                    cout << "Openning the first cashier!" << endl;
                }
                else
                {
                    // VERIFY CASHIERS AND PROCESS CUSTOMERS WAIT
                    Node<Cashier*> *node = this->cashierList->getFirst();
                    int listSize = this->cashierList->getSize();
                    for(int i=0; i<= listSize && node!=NULL; i++)
                    {
                        Cashier *cashier = node->getValue();
                        cashier->processCashier(rand);
                        if (cashier->customersLine->getSize()>0)
                        {
                            Customer *firstCustomer = cashier->getFirstCustomer();
                            int leftCustomerWaitTime = util->maxWaitLine - firstCustomer->getWaitingTime(util->time);

                            // ATTENTION!!! CUSTOMER WAITING ALERT!
                            if (cashier->busyTime > leftCustomerWaitTime) // NOT ENOUGH TIME
                            {
                                Cashier *available = getAvailableCashier(leftCustomerWaitTime);

                                if (available != NULL)
                                {
                                    available->customersLine->insert(firstCustomer);
                                }
                                else
                                {
                                    // NO OTHER CASHIER AVAILABLE
                                    Cashier *newCashier = new Cashier();
                                    newCashier->customersLine->insert(firstCustomer);
                                    cashier->customersLine->remove(firstCustomer);
                                    rand = util->getRand(util->minTimeAtCashier, util->maxTimeAtCachier);
                                    newCashier->processCashier(rand);
                                    this->cashierList->insert(newCashier);
                                    cout << "Openning an emergencial cashier! Customer waiting for more than " << util->getMinute(firstCustomer->getWaitingTime(util->time)) << " min"  << endl;
                                }
                            }
                        }

                        node = node->getNext();
                    } // End for


                    // ADD NEW CUSTOMER
                    node = this->cashierList->getFirst();
                    int minLine = 1000000, index = 0;
                    for(int i=0; i<= this->cashierList->getSize() && node!=NULL; i++)
                    {
                        Cashier *cashier = node->getValue();
                        if(cashier->getLineSize() < minLine)
                        {
                            minLine = cashier->getLineSize();
                            index = i;
                        }
                        node = node->getNext();
                    } // End for
                    LinkedList<Cashier*> *list = this->cashierList;
                    Cashier *cashier = list->getValueAt(index);
                    LinkedList<Customer*> *list1 = cashier->customersLine;
                    list1->insert(customer);
                } // END ELSE LIST NOT EMPTY

                // PREPARE NEXT CUSTOMER ARRIVING
                timeNextCustomer = util->getRand(minFlow, maxFlow);
                cout <<"Next curstomer arrives in " << util->getMinute(timeNextCustomer) << "min and " << util->getSeconds(timeNextCustomer)<< " seconds"<<endl;

            } // END CHECK ARRIVING CUSTOMER
            else
            {
                    Node<Cashier*> *node = this->cashierList->getFirst();
                    int i = 0;
                    while(node != NULL)
                    {
                        Cashier *cashier = node->getValue();
                        i++;
                        if (cashier->processCashier(rand))
                        {
                            cout << "Cashier " << i << " is available for next Customer"<<endl;
                            printStatus();
                        };
                        node = node->getNext();
                    } // End

            }


            // CHECK CURRENT CUSTOMERS STATUS

            if (util->time% (300 / (period_index+1)) == 0 ){
                printStatus();
                cout << endl;
                system("pause");
                getchar();
                cout << endl;

            }




            util->passTime();
            timeNextCustomer--;
        } // END TIME ITERATIONS

        // DISPLAY RESULTS
           for(int j = 0; j < 7; j++)
           {
                cout << "Starting at " << util->period[j] <<"h " << ": " << util->maxCashiers[j] <<endl;
           }
    } // END RUN()

};



int main()
{
    string filename = "config.txt";

    Util *util = new Util(filename.c_str());
    Application *app = new Application(util);
    app->run();
    return 0;
}
