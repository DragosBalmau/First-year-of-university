# Programming-Techniques-Homework

## Greedy

### Greedy1T21

```
Spectacole

Se dau N spectacole, pentru fiecare cunoscându-se identificatorul, ora de
început și ora de sfârșit a spectacolului (ore care definesc intervalul de timp
în care sala este rezervată, asigurându-se și intrarea/ieșirea spectatorilor)
Să se determine un număr maxim de spectacole care pot fi programate în
aceeași sală și în aceeași zi.

Date de intrare: fișierul date.in conține:

- pe prima linie un număr natural N, cu semnificația din enunț;
- pe următoarele N linii triplete de numere naturale de forma id start stop,

unde id – identificatorul unui spectacol, start – ora de la care se poate intra
în sală pentru acest spectacol, stop – ora la care s-a eliberat sala după
acest spectacol.
Date de ieșire: fișierul date.out conține identificatorii spectacolelor selectate,
în ordinea programării lor, câte unul pe rând.
Restricții și precizări:

2 <= N <= 100

Pentru fiecare spectacol

1 <= id <= N 
0 <= start, stop <= 24 start < stop

Exemplu:

date.in 
5
1 9 11
2 8 10
3 12 14
4 7 13
5 10 12

date.out
2
5
3
```

## Dynamic Programming
### pd1T1

```
Submulțime de sumă dată, cu elemente repetabile
Se dă o mulțime cu n elemente. Se urmărește obținerea unei sume s
adunând elemente ale multimii, care se pot repeta în cadrul sumei; se
cere să se verifice dacă se poate sau nu obține suma.
Date de intrare: fișierul date.in conține
- pe prima linie un numar natural, n;
- pe a doua linie, un șir de n numere naturale, separate prin
câte un spatiu, reprezentand elementele multimii
- pe ultima linie, un număr natural, s
Date de ieșire: fișierul date.out conține mesajul DA, dacă se poate
obține suma, sau mesajul NU în caz contrar

Restricții și precizări:

1 <= n,s <= 10^4
1 <= numerele din șir <= 2^n

Exemplu:

date.in 
4
4 6 9 3
11

date.out
DA
```

## Divide et Impera
### DivImp1T10

```
Fotografia
O fotografie alb-negru este memorată ca o matrice in care zonele
corespunzatoare obiectelor sunt notate cu 1, iar cele de fundal cu 0. Sa
se determine numarul obiectelor figurate in fotografie. Se considera ca
doua puncte apartin aceluiasi obiect daca ele sunt vecine si situate pe
aceeasi linie sau aceeasi coloana.

Date de intrare: fișierul date.in conține
-pe prima linie doua numere natural, m și n;
-pe urmatoarele linii elementele unei matrice cu m linii si n coloane, cu
semnificatia din enunt.

Date de ieșire: fișierul date.out conține numarul cerut.

Restricții și precizări:

1 <= m,n <= 10^4

Exemplu:

date.in 
4 6
0 0 0 1 1 0
1 0 0 0 1 0
1 0 1 0 0 0
0 0 1 0 0 1

date.out
4
```

### DivImp2T10

```
Pătrat
Să se construiască o matrice pătratică, având 3 n linii și 3 n coloane, cu
elemente din mulțimea {0,1} urmând următorul procedeu:

-se împarte tabloul în nouă subtablouri de latură 3 n-1
-se plasează valori 1 în subtabloul din mijloc
- se plasează valori 2 în subtablourile de sud și nord și valori 3 în
subtablourile de est și vest
- în etapa următoare se reia procedeul pentru fiecare dintre celelalte
patru subtablouri

Procedeul se realizează în k etape sau până când se obțin subtablouri
formate din câte un singur element, care vor avea valoare nulă.
Date de intrare: fișierul date.in conține numerele n și k, în această
ordine, cu semnificația din enunț.
Date de ieșire: fișierul date.out conține matricea construită.
Restricții și precizări:
n<10, k<10
Exemplu:

date.in 
2 2 

date.out
0 2 0 2 2 2 0 2 0
3 1 3 2 2 2 3 1 3
0 2 0 2 2 2 0 2 0
3 3 3 1 1 1 3 3 3
3 3 3 1 1 1 3 3 3
3 3 3 1 1 1 3 3 3
0 2 0 2 2 2 0 2 0
3 1 3 2 2 2 3 1 3
0 2 0 2 2 2 0 2 0
```

## Backtracking
### bkt3T13

```
Labirint
Un labirint este codificat ca o matrice cu M linii si N coloane,
in care se noteaza cu 0 culoarele si cu -1 zidurile. O
persoana se află in zona (l0,c0). Sa se gaseasca toate
posibilitatile de a iesi din labirint (de a ajunge pe marginea
acestuia).
Date de intrare: fișierul date.in conține:
- pe prima linie numerele M și N, în această ordine, cu
semnificația din enunț.
- pe următoarele M linii, matricea care memorează
configurația labirintului.
-pe ultima linie numerele naturale l0 si c0, cu semnificatia din
enunt
Date de ieșire: fișierul date.out conține soluțiile, separate
prin câte o linie goală; o soluție este o matrice in care se
codifica cu 0 culoarele prin care nu s-a trecut, cu -1 zidurile
si se marcheaza traseul cu numarul de ordine al pasilor
urmati. Restricții și precizări:
2 <= N,M <= 1000
1<=l0<=M
1<=c0<=N
Exemplu:

date.in 
5 6
0 -1 0 -1 -1 -1
-1 0 0 0 0 0
-1 0 -1 0 -1 0
-1 0 -1 0 0 0
-1 0 0 -1 -1 -1
3 2

date.out
0 -1 4 -1 -1 -1
-1 2 3 0 0 0
-1 1 -1 0 -1 0
-1 0 -1 0 0 0
-1 0 0 -1 -1 -1

0 -1 0 -1 -1 -1
-1 2 3 4 5 6
-1 1 -1 0 -1 0
-1 0 -1 0 0 0
-1 0 0 -1 -1 -1

0 -1 0 -1 -1 -1
-1 2 3 4 0 0
-1 1 -1 5 -1 0
-1 0 -1 6 7 8
-1 0 0 -1 -1 -1

0 -1 0 -1 -1 -1
-1 0 0 0 0 0
-1 1 -1 0 -1 0
-1 2 -1 0 0 0
-1 3 0 -1 -1 -1
```
