#include <iostream>
#include <cstdlib>
#include "Bola.h"

Bola::Bola(float d){
	this->d = d;
	espera = 0;
}

void Bola::setP(int x, int y){
	this->p.x = x;
	this->p.y = y;
}

void Bola::setP(const Ponto p){
	this->p.x = p.x;
	this->p.y = p.y;
}

void Bola::setCor(Cor_bola c){
	this->cor = c;
}

void Bola::randomColor(){
    srand (time(NULL));
    int randNum = rand() % 4;
    std::cout << "RAND: "<< randNum << std::endl;
    this->cor = static_cast<Cor_bola>(randNum);
}

void Bola::desenhaBola(BITMAP *buffer){//, Ponto p){
	int r, g, b;
	int d = getD();
	Ponto p = getP();
	Cor_bola c = getCor();
	switch(c){
		case AMARELO:
			r = 255;
			g = 255;
			b = 0;
			break;
		case VERDE:
			r = 0;
			g = 255;
			b = 0;
			break;
		case AZUL:
			r = 0;
			g = 0;
			b = 255;
			break;
		default: // VERMELHO:
			r = 255;
			g = 0;
			b = 0;
			break;
	}
	circlefill(buffer, p.x, p.y, d/2, makecol(r, g, b));

}
