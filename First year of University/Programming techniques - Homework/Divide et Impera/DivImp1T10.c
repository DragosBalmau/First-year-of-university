#include <stdio.h>
#include <stdlib.h>

void stergeObiecte(int **fotografie, int xCoord, int yCoord, int m, int n) {

    int dirX[4] = {-1, 0, 1, 0};
    int dirY[4] = {0, 1, 0, -1};

    if (fotografie[xCoord][yCoord] == 1) {
        fotografie[xCoord][yCoord] = 0;
        for (int i = 0; i < 4; i++)
            if (xCoord + dirX[i] >= 0 && xCoord + dirX[i] < m && yCoord + dirY[i] >= 0 && yCoord + dirY[i] < n)
                stergeObiecte(fotografie, xCoord + dirX[i], yCoord + dirY[i], m, n);
    }

}

int cautaObiecte(int **fotografie, int linieS, int coloanaS, int linieD, int coloanaD, int m, int n) {

    if (linieD == linieS || coloanaD == coloanaS) {
        if (fotografie[linieS][coloanaS] == 1) {

            stergeObiecte(fotografie, linieS, coloanaS, m, n);
            return 1;

        }
    } else {

        int linieM = (linieD + linieS) / 2;
        int coloanaM = (coloanaD + coloanaS) / 2;
        return cautaObiecte(fotografie, linieS, coloanaS, linieM, coloanaM, m, n)
               + cautaObiecte(fotografie, linieS, coloanaM + 1, linieM, coloanaD, m, n)
               + cautaObiecte(fotografie, linieM + 1, coloanaM + 1, linieD, coloanaD, m, n)
               + cautaObiecte(fotografie, linieM + 1, coloanaS, linieD, coloanaM, m, n);

    }
}

int main() {


    FILE *fIntrare = fopen("date.in", "r");
    FILE *fIesire = fopen("date.out", "w");

    //m - numarul de linii
    //n - numarul de coloane

    int m, n;

    fscanf(fIntrare, "%d %d ", &m, &n);

    int **fotografie;

    fotografie = malloc(m * sizeof(int *));
    for (int i = 0; i < m; i++)
        fotografie[i] = malloc(n * sizeof(int));

    for (int i = 0; i < m; i++)
        for (int j = 0; j < n; j++)
            fscanf(fIntrare, "%d ", &fotografie[i][j]);

    int numarObiecte = cautaObiecte(fotografie, 0, 0, m - 1, n - 1, m, n);

    fprintf(fIesire, "%d", numarObiecte);

    for (int i = 0; i < m; i++)
        free(fotografie[i]);
    free(fotografie);

    fclose(fIntrare);
    fclose(fIesire);


}
