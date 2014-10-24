#ifndef QUEUE_H
#define QUEUE_H

#include <list>
#include "Ball.h"

class Queue{
    private:
        std::list<Ball> ball;
        std::list<Ball>::iterator it;
        int qtd;
    public:
        Queue();
        Queue(int n);
        bool colision(Ball *b1, Ball *b2);
        void removeBall(Ball *b1, Ball *b2);
        void insertBall();

};

#endif // QUEUE_H
