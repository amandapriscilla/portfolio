#include "Queue.h"
#include <cmath>

Queue::Queue(){

}

/*Inicializa a lista de bolas com n bolas*/
Queue::Queue(int n){
    for(int i = 0; i < n; i++){
        Ball *b = new Ball();
        b->randomColor();
        ball.push_back(*b);
    }
    it = ball.begin();
}

/*se a distancia dos pontos for menor que a soma dos raios da bolas, retorna true... se não, retorna false */
bool Queue::colision(Ball *b1, Ball *b2){
    int dist;
    float soma;
    dist = sqrt(pow((b2->getX() - b1->getX()), 2) + pow((b2->getY() - b1->getY()), 2));
    soma = ((b1->getD()/2) + (b2->getD()/2));
        if(dist < soma){
            return true;
        }
    return false;
}

/*Verifica se houve colisão, se sim, verifica se suas bolas vizinhas tem o mesmo atributo de cor, se sim, remove a pequena 'cadeia'..  */
void Queue::removeBall(Ball *b1, Ball *b2){

    if(colision(b1, b2) == true){



    }

}

void Queue::insertBall(){



}
