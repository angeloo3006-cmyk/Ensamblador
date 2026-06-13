#ifndef JUEGO_H
#define JUEGO_H

#define MAPA_ANCHO 60
#define MAPA_ALTO 60
#define VENTANA_DIM 20

#define ROWS 60
#define COLS 60

typedef struct {
    int x;
    int y;
    int monedas;
    int tiene_llave;
} Jugador;

extern void recortar_ventana_asm(const char* mapa_grande, char* ventana_visible, int jugador_x, int jugador_y);

#endif