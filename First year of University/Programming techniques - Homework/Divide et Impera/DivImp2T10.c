#include <stdio.h>
#include <stdlib.h>
#include <math.h>

void impPatrat(int **patrat, int linieStanga, int coloanaStanga, int linieDreapta, int coloanaDreapta, int n, int k) {

    if (k != 0 && !(linieDreapta == linieStanga && coloanaDreapta == coloanaStanga)) {

        //Calculez dimensiunea matricei pentru a putea pun 1,2,3 acolu unde trebuie
        int dimensiuneMatrice = linieDreapta - linieStanga + 1;

        //Parcurg matricea si pun 1,2,3 acolo unde trebuie conform unor conditii deduse pentru fiecare pad de numere
        for (int xCoordonata = linieStanga; xCoordonata <= linieDreapta; xCoordonata++)
            for (int yCoordonata = coloanaStanga; yCoordonata <= coloanaDreapta; yCoordonata++) {

                //Centru cu 1
                if (((dimensiuneMatrice / 3) + linieStanga <= xCoordonata &&
                     xCoordonata < (2 * (dimensiuneMatrice / 3)) + linieStanga) &&
                    ((dimensiuneMatrice / 3) + coloanaStanga <= yCoordonata &&
                     yCoordonata < (2 * (dimensiuneMatrice / 3)) + coloanaStanga))
                    patrat[xCoordonata][yCoordonata] = 1;

                //N - S cu 2
                if (((0 <= xCoordonata && xCoordonata < (dimensiuneMatrice / 3) + linieStanga) ||
                     ((2 * (dimensiuneMatrice / 3) + linieStanga) <= xCoordonata &&
                      xCoordonata < dimensiuneMatrice + linieStanga)) &&
                    ((dimensiuneMatrice / 3) + coloanaStanga <= yCoordonata &&
                     yCoordonata < (2 * (dimensiuneMatrice / 3)) + coloanaStanga))
                    patrat[xCoordonata][yCoordonata] = 2;

                //E - V cu 3
                if (((0 <= yCoordonata && yCoordonata < (dimensiuneMatrice / 3) + coloanaStanga) ||
                     ((2 * (dimensiuneMatrice / 3) + coloanaStanga) <= yCoordonata &&
                      yCoordonata < dimensiuneMatrice + coloanaStanga)) &&
                    ((dimensiuneMatrice / 3) + linieStanga <= xCoordonata &&
                     xCoordonata < (2 * (dimensiuneMatrice / 3)) + linieStanga))
                    patrat[xCoordonata][yCoordonata] = 3;
            }

        //Scad pasul
        k--;

        //Calculez dimensiunile matricelor din colturi pentru a putea apela recursiv
        int linieMijloc1 = (dimensiuneMatrice / 3 - 1) + linieStanga;
        int linieMijloc2 = (2 * (dimensiuneMatrice / 3) - 1) + linieStanga;
        int coloanaMijloc1 = (dimensiuneMatrice / 3 - 1) + coloanaStanga;
        int coloanaMijloc2 = (2 * (dimensiuneMatrice / 3) - 1) + coloanaStanga;

        //Apelez subprogramul pentru matricele din colt
        impPatrat(patrat, linieStanga, coloanaStanga, linieMijloc1, coloanaMijloc1, n, k);
        impPatrat(patrat, linieStanga, coloanaMijloc2 + 1, linieMijloc1, coloanaDreapta, n, k);
        impPatrat(patrat, linieMijloc2 + 1, coloanaStanga, linieDreapta, coloanaMijloc1, n, k);
        impPatrat(patrat, linieMijloc2 + 1, coloanaMijloc2 + 1, linieDreapta, coloanaDreapta, n, k);

    }

}

int main() {

    FILE *fIntrare = fopen("0-date.in", "r");
    FILE *fIesire = fopen("date.out", "w");

    int n, k;
    fscanf(fIntrare, "%d %d", &n, &k);

    int **patrat;
    int dimensiune = (int) pow(3, n);

    patrat = calloc(dimensiune, sizeof(int *));
    for (int i = 0; i < dimensiune; i++)
        patrat[i] = calloc(dimensiune, sizeof(int));

    impPatrat(patrat, 0, 0, dimensiune - 1, dimensiune - 1, n, k);

    //Afisez matricea finala
    for (int i = 0; i < dimensiune; i++) {
        for (int j = 0; j < dimensiune; j++)
            fprintf(fIesire, "%d ", patrat[i][j]);
        fprintf(fIesire, "\n");
    }

    //Eliberez memoria si inchid fisierele
    for (int i = 0; i < dimensiune; i++)
        free(patrat[i]);
    free(patrat);

    fclose(fIntrare);
    fclose(fIesire);

}
