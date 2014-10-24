
#include <allegro.h>
#include "configAllegro.h"



int inicia_allegro(BITMAP *buffer, int WIDTH_, int HEIGHT_){

  /* you should always do this at the start of Allegro programs */
   if (allegro_init() != 0)
      return 1;
  install_timer();     // Instalar temporizador
  install_keyboard();  //Instalar o teclado para detectar o pressionamento de ESC
  install_mouse();     //Instala o mouse

  set_color_depth(32);

  set_window_title("Zuma");

 /* set a graphics mode sized 1280 x 720 */
   if (set_gfx_mode(GFX_AUTODETECT_WINDOWED, WIDTH_, HEIGHT_, 0, 0) != 0) {
      if (set_gfx_mode(GFX_SAFE, WIDTH_, HEIGHT_, 0, 0) != 0) {
        set_gfx_mode(GFX_TEXT, 0, 0, 0, 0);
        allegro_message("Unable to set any graphic mode\n%s\n", allegro_error);
        return 1;
      }
   }

  /* set the color palette */
  set_palette(desktop_palette);
  show_mouse(screen);


   return 0;
}

