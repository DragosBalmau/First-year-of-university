#include <stdio.h>
#include <stdlib.h>

//Struct pentru a stoca mai usor toate datele despre un spectacol
//Le-am declarat pe randuri diferite pentru a fi mai lizibil codul
struct Spectacol {

    int id;
    int oraInceput;
    int oraFinal;

};

void citireSpectacole(struct Spectacol *spectacole, int numarSpectacole, FILE *fIntrare) {

    for (int i = 0; i < numarSpectacole; i++)
        fscanf(fIntrare, "%d %d %d", &spectacole[i].id, &spectacole[i].oraInceput, &spectacole[i].oraFinal);
}

int cmp(const void *a, const void *b) {

    int a1 = ((struct Spectacol *) a)->oraFinal;
    int b1 = ((struct Spectacol *) b)->oraFinal;
    if(a1 < b1)
        return -1;
    if(a1 > b1)
        return 1;
    return 0;

}

void greedy(struct Spectacol *spectacole, int numarSpectacole, FILE *fIesire) {

    //Sortam in ordine crescatoare dupa oraFinal
    qsort(spectacole, numarSpectacole, sizeof(struct Spectacol), cmp);

    //Luam o variabila auxiliara care retine ultimul spectacol din lista
    struct Spectacol ultimulSpectacol = spectacole[0];

    //Afisam primul spectacol dupa sortare
    fprintf(fIesire, "%d\n", spectacole[0].id);

    //Verificam ce spectacol are oraInceput mai mare sau egala cu oraFinal a ultimului spectacol din lista si il afisam
    for (int i = 1; i < numarSpectacole; i++) {
        if (spectacole[i].oraInceput >= ultimulSpectacol.oraFinal) {
            fprintf(fIesire, "%d\n", spectacole[i].id);
            ultimulSpectacol = spectacole[i];
        }
    }
}

int main() {


    //Declar si deschid fisierele I/O
    FILE *fIntrare = fopen("date.in", "r");
    FILE *fIesire = fopen("date.out", "w");

    //Declar si citesc numarul de spectacole
    int numarSpectacole;
    fscanf(fIntrare, "%d", &numarSpectacole);

    //Alocare dinamica a array-ului de spectacole
    struct Spectacol *spectacole = malloc(numarSpectacole * sizeof(struct Spectacol));

    //Citirea spectacolelor din fisier
    citireSpectacole(spectacole, numarSpectacole, fIntrare);

    //Apelez functia de Greedy
    greedy(spectacole, numarSpectacole, fIesire);

    //Inchid fisierele I/O
    fclose(fIesire);
    fclose(fIntrare);

    //Eliberez memoria alocata dinamic array-ului de spectacole
    free(spectacole);
}
