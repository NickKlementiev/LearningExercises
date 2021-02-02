/***************************************************************************
 * fifteen.c
 *
 * CC50
 * Pset 3
 *
 * Implements The Game of Fifteen (generalized to d x d).
 *
 * Usage: fifteen d
 *
 * whereby the board's dimensions are to be d x d,
 * where d must be in [DIM_MIN,DIM_MAX]
 *
 * Note that usleep is obsolete, but it offers more granularity than
 * sleep and is simpler to use than nanosleep; `man usleep` for more.
 ***************************************************************************/
 
#define _XOPEN_SOURCE 500

#include <cc50.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <time.h>


// constants
#define DIM_MIN 3
#define DIM_MAX 9


// board
int board[DIM_MAX][DIM_MAX];

// dimensions
int d;


// prototypes
void clear(void);
void greet(void);
void init(void);
void draw(void);
bool move(int tile);
bool won(void);


int
main(int argc, char *argv[])
{
    // sets the random seed
    srand(time(NULL));

    // greet user with instructions
    greet();

    // ensure proper usage
    if (argc != 2)
    {
        printf("Usage: %s d\n", argv[0]);
        return 1;
    }

    // ensure valid dimensions
    d = atoi(argv[1]);
    if (d < DIM_MIN || d > DIM_MAX)
    {
        printf("Board must be between %d x %d and %d x %d, inclusive.\n",
         DIM_MIN, DIM_MIN, DIM_MAX, DIM_MAX);
        return 2;
    }

    // initialize the board
    init();

    // accept moves until game is won
    while (true)
    {
        // clear the screen
        clear();

        // draw the current state of the board
        draw();

        // check for win
        if (won())
        {
            printf("ftw!\n");
            break;
        }

        // prompt for move
        printf("Tile to move: ");
        int tile = GetInt();

        // move if possible, else report illegality
        if (!move(tile))
        {
            printf("\n\033[%d,%dmIllegal move.\033[%d,%dm\n", 0, 31, 0, 0);
            usleep(250000);
        }

        // sleep thread for animation's sake
        usleep(250000);
    }

    // that's all folks
    return 0;
}


/*
 * Clears screen using ANSI escape sequences.
 */

void
clear(void)
{
    printf("\033[2J");
    printf("\033[%d;%dH", 0, 0);
}


/*
 * Greets player.
 */

void
greet(void)
{
    clear();
    printf("\033[%d,%dmWELCOME TO THE GAME OF FIFTEEN\033[%d,%dm\n", 0, 32, 0, 0);
    usleep(1500000);
}


/*
 * Initializes the game's board with tiles numbered 1 through d*d - 1
 * (i.e., fills 2D array with values but does not actually print them).  
 */

void
init(void)
{
    // TODO

    // numbers initially in order 
    int x = 0;
    for (int i = 0; i < d; i++) {
        for (int j = 0; j < d; j++) {
            board[i][j] = x;
            x++;
        }
    }

    // scrambling the numbers
    int a, b;
    for (int i = 0; i < d; i++) {
        for (int j = 0; j < d; j++) {
            a = rand() % d;
            b = rand() % d;
            x = board[a][b];
            board[a][b] = board[i][j];
            board[i][j] = x;
        }
    }

    // putting the zero at its place
    for (int i = 0; i < d; i++) {
        for (int j = 0; j < d; j++) {
            if (board[i][j] == 0) {
                x = board[d - 1][d - 1];
                board[d - 1][d - 1] = board[i][j];
                board[i][j] = x;
            }
        }
    }

    // test drive (making the board ready by one move)
    //x = 1;
    //for (int i = 0; i < d; i++) {
    //    for (int j = 0; j < d; j++) {
    //        if (i == d - 1 && j == d - 2)
    //            board[i][j] = 0;
    //        else
    //            board[i][j] = x++;
    //    }
    //}
    

}


/* 
 * Prints the board in its current state.
 */

void
draw(void)
{
    // TODO
    
    // printing the numbers in a simulated table with pipes
    for (int i = 0; i < d; i++) {
        for (int j = 0; j < d; j++) {
            int printed = board[i][j];
            if (j == d - 1) {
                if (printed == 0) printf("|  _  |\n");
                else {
                    if (printed < 10) printf("|  %d  |\n", printed);
                    else printf("|  %d |\n", printed);
                }
            }
            else {
                if (printed == 0) printf("|  _  ");
                else {
                    if (printed < 10) printf("|  %d  ", printed);
                    else printf("|  %d ", printed);
                }
            }
        }
    }
}


/* 
 * If tile borders empty space, moves tile and returns true, else
 * returns false. 
 */

bool
move(int tile)
{
    // TODO

    // finds the position of the tile and the empty space
    // x and y being the tile's positions
    // zx and zy being the zero's positions
    int x, y, zx, zy;
    for (int i = 0; i < d; i++) {
        for (int j = 0; j < d; j++) {
            if (board[i][j] == tile) {
                x = i;
                y = j;
            }
            if (board[i][j] == 0) {
                zx = i;
                zy = j;
            }
        }
    }

    // checks if the tile is indeed movable
    // the logic is:
    // 
    // if the tile's x position is the same as the empty space's, then validate if the tile's y position
    // has a difference of one unit towards the empty space's zy
    //
    // if the tile's y position is the same as the empty space's, then validate if the tile's x position
    // has a difference of one unit towards the empty space's zx
    if ((x == zx && (y == zy - 1 || y == zy + 1)) || (y == zy && (x == zx - 1 || x == zx + 1))) {
        int temp = board[x][y];
        board[x][y] = board[zx][zy];
        board[zx][zy] = temp;
        return true;
    }

    return false;
}


/*
 * Returns true if game is won (i.e., board is in winning configuration), 
 * else false.
 */

bool
won(void)
{
    // TODO

    // logic: to win, every number starting from the first tile has to be in sequence (from 1 to the tiles max)
    // the function validates if the x counter is equal to the max tiles at the sequence condition
    // and if the empty tile is staying at the end of the board
    int x = 1;
    bool z = false;
    for (int i = 0; i < d; i++) {
        for (int j = 0; j < d; j++) {
            if (board[i][j] == x) x++;
            else if (i == d - 1 && j == d - 1 && board[i][j] == 0) {
                z = true;
            }
        }
    }
    if (x == d * d && z) return true;
    return false;
}
