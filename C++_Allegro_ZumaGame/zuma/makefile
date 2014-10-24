
CC    = g++
CFLAGS= -std=c++11 -I. -I/usr/local/include
LIBS  = -L/usr/local/lib -lalleg-4.2.3 -lalleg_unsharable

OBJ   = main.o Bola.o Caminho.o Fila.o Canhao.o configAllegro.o

%.o: %.cpp
	$(CC) -c -o $@ $< $(CFLAGS)

zuma: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS) $(LIBS)

.PHONY: clean

clean:
	rm -f *.o *~ core
