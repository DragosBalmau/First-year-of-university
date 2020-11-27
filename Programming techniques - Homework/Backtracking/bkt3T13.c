#include <stdio.h>
#include <stdlib.h>

// Declar global dimensiunile matricei si pasul pentru a nu avea 7 parametrii in functia de
// BT si astfel sa fie mai vizibila rezolvarea

int M, N, counter = 1;

void citireMatrice(int **labirint, int M, int N, FILE *fIntrare) {

    for (int i = 0; i < M; i++)
        for (int j = 0; j < N; j++)
            fscanf(fIntrare, "%d ", &labirint[i][j]);

}

void afisareMatrice(int **labirint, int M, int N, FILE *fIesire) {

    //Afisez matricea cat mai lizibil

    for (int i = 0; i < M; i++) {
        for (int j = 0; j < N; j++)
            fprintf(fIesire, " %2d ", labirint[i][j]);
        fprintf(fIesire, "\n");
    }
    fprintf(fIesire, "\n");
}

void backtracking(int **labirint, int x, int y, FILE *fIesire) {

    if (labirint[x][y] == 0) { // Verific daca este drum liber

        labirint[x][y] = counter;// Afisez pasul
        counter++;

        if (x == 0 || x == M - 1 || y == 0 || y == N - 1) // Verific daca sunt pe marginea matricei

            afisareMatrice(labirint, M, N, fIesire);

        else {

            backtracking(labirint, x - 1, y, fIesire); // Apelez pentru N
            backtracking(labirint, x, y + 1, fIesire); // Apelez pentru E
            backtracking(labirint, x + 1, y, fIesire); // Apelez pentru S
            backtracking(labirint, x, y - 1, fIesire); // Apelez pentru V
        }

        labirint[x][y] = 0; // Pun 0 cand merg cu un pas inapoi
        counter--;

    }

}

int main() {

    //Declar si deschid fisierele I/O

    FILE *fIntrare = fopen("date.in", "r");
    FILE *fIesire = fopen("date.out", "w");

    //Citirea dimensiunilor matricei

    fscanf(fIntrare, "%d %d", &M, &N);

    //Alocarea dinamica a matricei si citirea ei

    int **labirint = (int **) malloc(M * sizeof(int *));
    for (int i = 0; i < M; i++)
        labirint[i] = (int *) malloc(N * sizeof(int));

    citireMatrice(labirint, M, N, fIntrare);

    //Declar si citesc pozitiile de plecare

    int startX, startY;

    fscanf(fIntrare, "%d %d", &startX, &startY);

    //Apelez functia backtracking de startX - 1 si startY - 1, deoarece coordonatele pleaca de la 1 (asa e in exemplu),
    //iar matricea mea de la 0

    backtracking(labirint, startX - 1, startY - 1, fIesire);

    //Inchid fisierele I/O

    fclose(fIesire);
    fclose(fIntrare);

    //Eliberez memoria alocata dinamic pentru matricea labirint

    for (int i = 0; i < M; i++)
        free(labirint[i]);
    free(labirint);

}
