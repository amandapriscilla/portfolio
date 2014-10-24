#include "Canhao.h"
#include "Bola.h"
#include "Ponto.h"
#include "Fila.h"

Canhao::Canhao(Ponto p1){
	setP(p1.x, p1.y);
	proxBola = new Bola(50);
	proxBola->randomColor();
	proxBola->setP(p1.x+40, p1.y-5);
	tiro = false;
}

void Canhao::desenhaCanhao(BITMAP *buffer, bool podeRecarregar){
	if(!podeRecarregar) return;
	Cor_bola c = proxBola->getCor();
	int r, g, b;

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
		case VERMELHO:
			r = 255;
			g = 0;
			b = 0;
			break;
		default:
			r = 0;
			g = 0;
			b = 0;
	}

	circlefill(buffer, proxBola->getP().x, proxBola->getP().y, proxBola->getD()/2, makecol(r, g, b));

}

void Canhao::setP(int x, int y){
	this->p.x = x;
	this->p.y = y;
}

void Canhao::mover(){
		if((key[KEY_RIGHT] || key[KEY_DOWN])&& this->tiro == false){
            if(p.x < 1200){
                this->proxBola->setP(proxBola->getP().x+10, proxBola->getP().y); // bola do canhao
                setP(this->p.x+10, this->p.y);
            }
		}
		else if((key[KEY_LEFT] || key[KEY_UP]) && this->tiro == false){
			if(p.x > 40){
                this->proxBola->setP(proxBola->getP().x-10, proxBola->getP().y); // bola do canhao
                setP(this->p.x-10, this->p.y);
			}
		}
}

Bola *Canhao::tentaAtirar(bool podeAcertar){
	if(podeAcertar){
        std::cout << "PODE ACERTAR!!!"<<std::endl;
        return atira();
    }
	tiro = false;
	return NULL;

}


Bola *Canhao::atira(){
        Ponto pb = proxBola->getP();
        Bola *b = proxBola;
		proxBola = new Bola(50);
		proxBola->randomColor();
		proxBola->setP(pb.x, pb.y);
	return b;

}


