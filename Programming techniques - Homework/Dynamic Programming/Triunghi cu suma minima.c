#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
//Functie minim
int minim(int a, int b) {

    return a < b ? a : b;
}

int main() {

    //Declararea fisierelor de intrare si deschiderea acestora cu drepturile respective
    FILE *fIntrare = fopen("2-date.in", "r");
    FILE *fIesire = fopen("date.out", "w");

    //Declararea dimensiunii matricelor si matricele
    int n, **matrice, **rezolvare;

    //Alocarea dinamica a celor doua matrici si citirea datelor de intrare
    fscanf(fIntrare, "%d", &n);
    matrice = malloc(n * sizeof(int *));
    rezolvare = malloc(n * sizeof(int *));

    for (int i = 0; i < n; i++) {
        matrice[i] = malloc((i + 1) * sizeof(int));
        rezolvare[i] = malloc((i + 1) * sizeof(int));
        for (int j = 0; j <= i; j++)
            fscanf(fIntrare, "%d", &matrice[i][j]);
    }

    //Copiez ultima linie a triunghiului in matricea in care lucrez
    for (int i = 0; i < n; i++)
        rezolvare[n - 1][i] = matrice[n - 1][i];

    //Calculez matricea rezolvare prin adaugarea elementului matrice[i][j] + minimul dintre S si S-E
    for (int i = n - 2; i >= 0; i--)
        for (int j = 0; j <= i; j++)
            rezolvare[i][j] = matrice[i][j] + minim(rezolvare[i + 1][j], rezolvare[i + 1][j + 1]);

    //Aici se afla suma minima calculata
    fprintf(fIesire, "SUMA MINIMA ESTE: %d\n\n", rezolvare[0][0]);

    fprintf(fIesire, "PRIMELE 3 VARIANTE DE FORMARE A UNEI SUME MINIME CARE NU SE INTERSECTEAZA:\n\n");
    for (int k = 0; k < 3; k++) {
        int j = 0;
        fprintf(fIesire, "matrice[%d][%d] -> ", 0, 0);
        for (int i = 0; i < n - 1; i++) {
            rezolvare[i][j] = INT_MAX;
            if (rezolvare[i + 1][j + 1] < rezolvare[i + 1][j])
                j++;
            fprintf(fIesire, "matrice[%d][%d] -> ", i, j);
        }

        fprintf(fIesire, "matrice[%d][%d]\n", n - 1, j);
        rezolvare[n-1][j] = INT_MAX;

    }
    //Eliberare memorie
    for (int i = 0; i < n; i++) {
        free(matrice[i]);
        free(rezolvare[i]);
    }
    free(matrice);
    free(rezolvare);

    //Inchidere fisiere
    fclose(fIntrare);
    fclose(fIesire);

}
