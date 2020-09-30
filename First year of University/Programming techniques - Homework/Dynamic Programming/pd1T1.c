#include <stdio.h>
#include <stdlib.h>

int main() {

    //Declararea fisierelor de intrare si deschiderea acestora cu drepturile respective
    FILE *fIntrare = fopen("0-date.in", "r");
    FILE *fIesire = fopen("date.out", "w");

    //Declararea dimensiunii vectorilor si vectorii
    int n, *sir, *rezolvare;

    //Alocarea dinamica a celor doi vectori si citirea datelor de intrare
    fscanf(fIntrare, "%d", &n);
    sir = malloc(n * sizeof(int));

    for (int i = 0; i < n; i++)
        fscanf(fIntrare, "%d", &sir[i]);

    int suma;
    fscanf(fIntrare, "%d", &suma);

    rezolvare = calloc(suma + 1, sizeof(int));

    rezolvare[0] = 1;
    for (int i = 0; i < n; i++)
        for (int j = 0; j < suma - sir[i] + 1; j++)
            if(rezolvare[j] != 0) {
                rezolvare[j + sir[i]] = 1;
                fprintf(fIesire,"%d + %d = %d\n", j, sir[i], j + sir[i]); // sumele partiale la fiecare pas, fara cele care depasesc suma, pentru ca nu ne intereseaza ce e peste suma
            }

    if(rezolvare[suma]) {

        fprintf(fIesire, "DA");
    }
    else
        fprintf(fIesire, "NU");

    //Eliberare memorie
    free(sir);
    free(rezolvare);

    //Inchidere fisiere
    fclose(fIntrare);
    fclose(fIesire);

}
