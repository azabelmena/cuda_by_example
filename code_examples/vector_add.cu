#include<stdio.h>
#include<stdlib.h>

const int SIZE = 100000;

__global__
void populate(int *a){

    int i = blockIdx.x;
    if(i<SIZE){
        a[i]=i;
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

__global__
void vector_add(int *a, int *b, int *c){

    int i = blockIdx.x;

    if(i < SIZE){
        c[i] = a[i]+b[i];
    }
}

int main(){

    int a[SIZE];
    int b[SIZE];
    int c[SIZE];

    int *dev_a;
    int *dev_b;
    int *dev_c;

    cudaMalloc(&dev_a, sizeof(a));
    cudaMalloc(&dev_b, sizeof(b));
    cudaMalloc(&dev_c, sizeof(c));

    cudaMemcpy(dev_a, a, sizeof(a), cudaMemcpyHostToDevice);
    cudaMemcpy(dev_b, b, sizeof(b), cudaMemcpyHostToDevice);

    populate<<<SIZE, 1>>>(dev_a);
    populate<<<SIZE, 1>>>(dev_b);

    vector_add<<<SIZE, 1>>>(dev_a,dev_b,dev_c);


    cudaMemcpy(c, dev_c, sizeof(c), cudaMemcpyDeviceToHost);

    print(c);

    cudaFree(dev_a);
    cudaFree(dev_b);
    cudaFree(dev_c);

    return 0;
}
