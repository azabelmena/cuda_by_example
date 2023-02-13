#include<stdio.h>
#include<stdlib.h>

const int N = 100;
const int M = 100;

void populate(int a[N][M]){
    for(int i = 0; i < N ; i++){
        for(int j = 0; j < M ; j++){
            a[i][j] = i*j;
        }
    }

    return;
}

void print(int a[N][M]){
    for(int i = 0; i < N ; i++){
        for(int j = 0; j < M ; j++){
            printf("%d\t", a[i][j]);
        }
        printf("\n");
    }

    return;
}

void mult(int a[N][M], int b[N][M], int c[N][M]){

    for(int i = 0; i < N ; i++){
        for(int j = 0; j < M ; j++){
            c[i][j] = a[i][j]*b[i][j];
        }
    }

    return;
}

int main(){

    int a[N][M];
    int b[N][M];
    int c[N][M];

    populate(a);
    populate(b);

    mult(a,b,c);

    print(c);

    return 0;
}
