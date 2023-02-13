#include<stdio.h>
#include<stdlib.h>

const int N = 10;
const int M = 10;

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
    printf("\n");

    return;
}

int main(){

    int a[N][M];

    populate(a);
    print(a);

    return 0;
}
