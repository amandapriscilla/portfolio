#ifndef BOLA_H
#define BOLA_H

#include <allegro.h>
#include <list>
#include "Ponto.h"

enum Cor_bola{AMARELO, VERDE, AZUL, VERMELHO};

class Bola{
    private:
        Ponto p;
        int d; /*diâmetro da bola*/
        Cor_bola cor;
        int espera;

    public:
        Bola(float d=0);
        void randomColor();
        Ponto getP(){return this->p; }
        void setCor(Cor_bola c);
        Cor_bola getCor() { return this->cor; }
        int getD() { return this->d; }
        int getEspera(){ return espera; }
        void addEspera(int e){ espera += e; }
        void setP(int x, int y);
        void setP(const Ponto p);

        void desenhaBola(BITMAP *buffer);//, Ponto p);

};

#endif //BALL_H
