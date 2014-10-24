#include "Caminho.h"
#include "Ponto.h"
#include <iostream>
#include <cstdio>

void Caminho::calcProximaCoordenada(Ponto *_p) {

    if(_p->y == 25 && _p->x < 340){
            _p->x++;
    } else if (_p->x == 340 && _p->y< 120){
            _p->y++;
    } else if(_p->y == 120 && _p->x > 185 && _p->x < 400){
            _p->x--;
    } else if (_p->x == 185 && _p->y< 540){
            _p->y++;
    } else if(_p->y == 540 && _p->x < 1100){
            _p->x++;
    } else if (_p->x == 1100 && _p->y > 130){
            _p->y--;
    } else if (_p->y == 130 && _p->x > 450){
            _p->x--;
    } else{

        if(_p->y == 130 && _p->x == 450)
         fimDeJogo = true;
    }
}

bool Caminho::fimDeJogo = false;



