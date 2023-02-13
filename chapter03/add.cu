#include<stdio.h>

__global__
void add(int a, int b, int *c){

    *c = a+b;

    return;
}

int main(){

    cudaSetDevice(0);

    int c;
    int *dev_c;

    cudaMalloc(&dev_c, sizeof(int));

    add<<<1,1>>>(2,7,dev_c);

    cudaMemcpy(&c, dev_c, sizeof(int), cudaMemcpyDeviceToHost);

    printf("2+7=%d\n",c);
    cudaFree(dev_c);

    return 0;
}
