#include<stdio.h>
#include<stdlib.h>

const int SIZE = 100000;


void populate(int *a){
    for(int i = 0; i < SIZE ; i++){
        a[i] = i;
    }

    return;
}

void print(int *a){
    for(int i = 0; i < SIZE ; i++){
        printf("%d\t",a[i]);
    }
    printf("\n");

    return;
}

void vector_add(int *a, int *b, int *c){

    for(int i = 0; i < SIZE ; i++){
        c[i] = a[i]+b[i];
    }

    return;
}

int main(){

    int *a = malloc(SIZE*sizeof(int));
    int *b = malloc(SIZE*sizeof(int));
    int *c = malloc(SIZE*sizeof(int));

    populate(a);
    populate(b);

    vector_add(a,b,c);

    print(c);

    free(a);
    free(b);
    free(c);

    return 0;
}
