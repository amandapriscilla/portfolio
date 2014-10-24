#include <iostream>
#include <cstdio>
#include <cstring>
#include <allegro.h>
#include "configAllegro.h"
#include "Caminho.h"
#include "Fila.h"
#include "Canhao.h"


BITMAP *buffer;   //Um ponteiro que cria o bitmap para fazer o Buffer (Variável Global)
BITMAP *bg;
BITMAP *canhao;
BITMAP *vitoria;
BITMAP *derrota;
int WIDTH_ = 1280;
int HEIGHT_ = 720;

void atualizaTela(){
  blit(buffer, screen, 0, 0, 0, 0, SCREEN_W, SCREEN_H);
}

int inicia_doubleBuffer(){

    bg = load_bitmap("assets/bg.bmp", NULL);
    if (!bg){
        std::cout<<"Error loading bg.bmp";
    }

    canhao = load_bitmap("canhao.bmp", NULL);
    if (!canhao){
        std::cout<<"Error loading canhao.png";
    }

    vitoria = load_bitmap("assets/vitoria.bmp", NULL);
    if (!vitoria){
        std::cout<<"Error loading vitoria.png";
    }

    derrota = load_bitmap("assets/derrota.bmp", NULL);
    if (!derrota){
        std::cout<<"Error loading derrota.png";
    }


    buffer = create_bitmap(WIDTH_, HEIGHT_);
      if(!buffer){
          return -1;
      }
    return 0;
}

int main(void){

  inicia_allegro(buffer, WIDTH_,HEIGHT_);

  inicia_doubleBuffer();

  bool ativo = true;    //criamos a variável que controla o loop


  Ponto p1; //do canhao
  p1.x = WIDTH_/2-60;
  p1.y = HEIGHT_-40;


  Canhao *jogador= new Canhao(p1);
  jogador->setP(p1.x, p1.y);

  Fila *fila = new Fila();


  /* ----------- LOOP DO JOGO ----------------*/
  while(ativo){
        if(key[KEY_ESC]){
          ativo = false;
        }

    clear(buffer);
    clear_keybuf();
    draw_sprite(buffer, bg, 1, 1);
    draw_sprite(buffer, canhao, jogador->getP().x, jogador->getP().y); //jogador->getP().x, jogador->getP().y-20);

    fila->insereNovaBola();

    fila->desenhaBolas(buffer);

    if(key[KEY_SPACE]){
        Bola *b = jogador->tentaAtirar(fila->getBolaTiro()==NULL);
        if (b!= NULL){
            fila->setBolaTiro(b);
       }
    }

    fila->checaColisao();

    jogador->desenhaCanhao(buffer, (fila->getBolaTiro()==NULL));
    jogador->mover();


 if(fila->getBolas().size()==0){
        draw_sprite(buffer, vitoria, WIDTH_/2-100, HEIGHT_/2-200);
    }

    if(Caminho::fimDeJogo){
        draw_sprite(buffer, derrota, 1, 1);
    }
    atualizaTela();


      /* you must always release bitmaps before calling any input functions */
    //release_screen();



      rest(10);

   } // END OF LOOP

    destroy_bitmap(buffer);


    /* wait for a keypress */
    readkey();

   return 0;


}
END_OF_MAIN()


