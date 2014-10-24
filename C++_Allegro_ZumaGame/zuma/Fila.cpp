#include "Fila.h"
#include "Caminho.h"
#include <cmath>
#include <algorithm>
#include <list>
#include <iostream>
using std::list;


Fila::Fila(){
    qtd = 0;
    posInicial.x = -25;
    posInicial.y = 25;
    bolaTiro = NULL;
    bolaTiroColidida = NULL;
    maxQtd = 20;
    it = bola_lista.end();
}

double Fila::calculaDistancia(const Ponto p1, const Ponto p2){
    return sqrt((p2.x - p1.x)*(p2.x - p1.x) + (p2.y - p1.y)*(p2.y - p1.y));
}

void Fila::insereBola(Bola *b){
    bola_lista.push_back(*b);
    qtd++;
}

void Fila::insereNovaBola(){
    if(qtd >= maxQtd) return;
    std::cout << "INSERE NOVA BOLA" << std::endl;
    if(qtd == 0){
        Bola *b = new Bola(50);
        b->setP(posInicial);
        b->randomColor();
        insereBola(b);
        std::cout << "PRIMEIRA" << std::endl;

    } else {
        list<Bola>::iterator ultimo = bola_lista.end();
        ultimo--;
        Ponto p = ultimo->getP();
        if (p.x > 25){
            Bola *b = new Bola(50);
            b->setP(posInicial);
            b->randomColor();
            insereBola(b);
            std::cout << "+ 1 BOLA" << std::endl;
        }
    }
}


void Fila::desenhaBolas(BITMAP *buffer){
    list<Bola>::iterator it_b = bola_lista.begin();

    while(it_b != bola_lista.end()){
        Ponto p = it_b->getP();
        /* CALCULA PROXIMO PONTO SE NAO TIVER PAUSADO(ESPERA>0)*/
        if(it_b->getEspera()>0) it_b->addEspera(-1);
        else  Caminho::calcProximaCoordenada(&p);
        it_b->setP(p);


        it_b->desenhaBola(buffer);
        it_b++;
    }
    if(bolaTiro!=NULL){
        if(bolaTiro->getP().y > 0){
            bolaTiro->setP(bolaTiro->getP().x, bolaTiro->getP().y-20);
            bolaTiro->desenhaBola(buffer);
        } else{ // Significa que a bola saiu da tela sem colidir
            delete bolaTiro;
            bolaTiro = NULL;
        }
    }
}


bool Fila::colidiu(const Ponto p1, const Ponto p2){
    double dist = calculaDistancia(p1, p2);
        if(dist < 50){
            return true;
        }
    return false;
}





/*se a distancia dos pontos for menor que a soma dos raios da bolas, retorna true... se não, retorna false */
bool Fila::checaColisao(){
    if (bolaTiro != NULL && bolaTiroColidida==NULL){
        std::cout<<"CHECA SE HOUVE COLISAO..." << std::endl;
        list<Bola>::iterator it_b = bola_lista.begin();
        while(it_b != bola_lista.end()){
            if(colidiu(it_b->getP(), bolaTiro->getP())){
                std::cout<<"***********COLIDIU!!!**********" << std::endl;
                executaZuma(it_b);

                bolaTiro = NULL;

                return true;
            }
            it_b++;
        }
        std::cout<<"SEM COLICAO.." << std::endl;
    }

    return false;
}

void Fila::executaZuma(list<Bola>::iterator it_colisao){
    Cor_bola cor = bolaTiro->getCor();
    int qtd = getQtdCor(cor, it_colisao);
    list<Bola>::iterator it_antes = it_colisao;
    list<Bola>::iterator it_depois = it_colisao;
    it_depois++;
    it_antes--;

    std::cout<<"QTD -----> "<<qtd<<std::endl;
    //if(int(bola->getCor()) == int(it_colisao->getCor())){
    if(qtd>1){
        it_colisao= removeBolas(getFirstToRemove(cor, it_colisao), getLastToRemove(cor, it_colisao), qtd);

    }
    else{
        std::cout<<"COLIDIU COM OUTRA COR.. Insere apenas.." << std::endl;
        insereCadeia(it_colisao);
    }
}


/** Determina quando pode atirar pra acertar outra bola */
 bool Fila::podeAtirarBola(Bola *tiro){
    if (bolaTiro != NULL){
        std::cout<<"BOLA JA FOI ATIRADA" << std::endl;
        return false;
    }
    std::cout<<"CHECA SE PODE ACERTAR (EXISTE A COR)..." << std::endl;
    list<Bola>::iterator it_b = bola_lista.begin();
    while(it_b != bola_lista.end()){
        if(int(it_b->getCor()) == int(tiro->getCor())){
            std::cout<<"SIM, PODE ACERTAR!!!" << std::endl;
            return true;
        }
        it_b++;
    }
    return false;
 }

void Fila::insereCadeia(const list<Bola>::iterator it_colisao){
        list<Bola>::iterator aux = bola_lista.begin();
        bolaTiro->setP(it_colisao->getP());
        Ponto p = bolaTiro->getP();
        Caminho::calcProximaCoordenada(&p);
        bolaTiro->setP(p);
        bola_lista.insert(it_colisao, *bolaTiro);

        int i = 1;
        Ponto p1;
        if(aux == it_colisao){
            while(i <= 50){
                p1 = aux->getP();
                Caminho::calcProximaCoordenada(&p1);
                aux->setP(p1);
                i++;
            }

            i = 1;
        }
        else{

            while(aux != it_colisao){
                p1 = aux->getP();
                Caminho::calcProximaCoordenada(&p1);
                aux->setP(p1);
                if(i == 50){
                    aux++;
                    i = 0;
                }
                i++;
            }
        }

        aux = static_cast<list<Bola>::iterator>(NULL);

}
int Fila::getQtdCor(Cor_bola cor, list<Bola>::iterator it_b){
    list<Bola>::iterator it_depois = it_b;
    list<Bola>::iterator it_antes = it_b;
    it_antes--;
    int qtd = 0;
    while(it_depois!= bola_lista.end() && cor == it_depois->getCor()){
        qtd++;
        it_depois++;
    }
    while(cor == it_antes->getCor()){
        qtd++;
        if(it_antes==bola_lista.begin()) break;
        it_antes--;
    }
    return qtd;
}


list<Bola>::iterator Fila::removeBolas(list<Bola>::iterator it1, list<Bola>::iterator it2, int qtd){
    // manda o inicio da fila esperar pelo resto q irá separar pela remoçao

    for (it=bola_lista.begin(); it != it2; it++){
        std::cout << it->getP().x <<" "<<it->getP().y <<std::endl;
        it->addEspera(50*qtd);
    }
    it1 = bola_lista.erase(it1, it2);
    std::cout << it->getP().x <<" "<<it->getP().y <<std::endl;

    return it1;

}


list<Bola>::iterator Fila::getFirstToRemove(Cor_bola cor, list<Bola>::iterator it_b){
    list<Bola>::iterator it_antes = it_b;
    while(cor == it_antes->getCor()){
        if(it_antes==bola_lista.begin()) break;
        it_antes--;
    }
    if(cor != it_antes->getCor()) it_antes++;
    return it_antes;
}

list<Bola>::iterator Fila::getLastToRemove(Cor_bola cor, list<Bola>::iterator it_b){
    list<Bola>::iterator it_depois = it_b;
    while(it_depois!= bola_lista.end() && cor == it_depois->getCor()){
        it_depois++;
    }
    return it_depois;
}



