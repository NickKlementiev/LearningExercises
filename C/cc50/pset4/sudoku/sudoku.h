/****************************************************************************
 * sudoku.h
 *
 * CC 50
 * Pset 4
 *
 * Compile-time options for the game of Sudoku.
 ***************************************************************************/

// game's author
#define AUTHOR "Nikita Klementiev"

// game's title
#define TITLE "Sudoku"

// banner's colors
#define FG_BANNER COLOR_RED
#define BG_BANNER COLOR_BLACK

// grid's colors
#define FG_GRID COLOR_WHITE
#define BG_GRID COLOR_BLACK

// border's colors
#define FG_BORDER COLOR_BLACK
#define BG_BORDER COLOR_RED

// logo's colors
#define FG_LOGO COLOR_MAGENTA
#define BG_LOGO COLOR_BLACK

// input number's colors
#define FG_NUM COLOR_YELLOW
#define BG_NUM COLOR_BLACK

// right number's colors
#define FG_WON COLOR_GREEN
#define BG_WON COLOR_BLACK

// nicknames for pairs of colors
enum { PAIR_BANNER = 1, PAIR_GRID, PAIR_BORDER, PAIR_LOGO, PAIR_NUM, PAIR_WON };
