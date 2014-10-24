#ifndef FILA_H
#define FILA_H
#include <list>
#include "Bola.h"
using std::list;

class Fila{
    private:
        list<Bola> bola_lista;
        list<Bola>::iterator it;
        Bola *bolaTiro;
        Bola *bolaTiroColidida;
        Ponto posInicial;
        int maxQtd;
        int qtd;
        double calculaDistancia(const Ponto p1, const Ponto p2);
    public:
        Fila();
        Fila(int n);
        list<Bola> getBolas(){ return bola_lista; }
        void setBolaTiro(Bola *b){ bolaTiro = b; }
        Bola *getBolaTiro(){ return bolaTiro; }
        void desenhaBolas(BITMAP *buffer);
        bool podeAtirarBola(Bola *tiro);
        bool checaColisao();
        bool colidiu(const Ponto p1, const Ponto p2);
        void insereBola(Bola *b);
        void insereNovaBola();
        void insereCadeia(const list<Bola>::iterator it_b);
        void executaZuma(list<Bola>::iterator it_b);
        int getQtdCor(Cor_bola cor, list<Bola>::iterator it_b);
        list<Bola>::iterator getFirstToRemove(Cor_bola cor, list<Bola>::iterator it_b);
        list<Bola>::iterator getLastToRemove(Cor_bola cor, list<Bola>::iterator it_b);
        list<Bola>::iterator removeBolas(list<Bola>::iterator it1,list<Bola>::iterator it2, int qtd);



};

#endif // FILA_H
