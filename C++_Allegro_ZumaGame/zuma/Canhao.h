#ifndef CANHAO_H
#define CANHAO_H
#include <allegro.h>
#include <iostream>
#include "Ponto.h"
#include "Bola.h"


class Canhao {
    private:
  		Ponto p; //Ponto inicial do canhão
  		Bola *proxBola;
  	public:
  	    bool tiro;
  		Canhao(Ponto p1);
  		Bola *getProxBola() {return this->proxBola; }
  		Ponto getP() {return this->p; }
  		void setP(int x, int y);
  		Bola *tentaAtirar(bool podeAcertar);
        Bola *atira();
  		bool getTiro() { return tiro; }
  		void mover();
  		void desenhaCanhao(BITMAP *buffer,  bool podeRecarregar);

};
#endif
