#ifndef CAMINHO_H_INCLUDED
#define CAMINHO_H_INCLUDED
#include "Ponto.h"
#include "Bola.h"
#include <list>

class Caminho {
    public:
        static bool fimDeJogo;
        static Ponto p;
        static void calcProximaCoordenada(Ponto *_p);
};
#endif
