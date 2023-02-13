#include<stdio.h>

int main(){

    cudaDeviceProp prop;

    int count = 0;

    cudaGetDeviceCount(&count);

    printf("CUDA Capable Devices:\t%d\n", count);

    for(int i = 0; i < count ; i++){
        cudaGetDeviceProperties(&prop, i);
        printf("General information for device %d\n", i);
        printf("Name:\t%s\n",prop.name);
        printf("Cupute Capability:\t%d.%d\n", prop.major,  prop.minor);
        printf("Clock Rate:\t%d\n", prop.clockRate);
        printf("Device copy overlap:\t");
            if(prop.deviceOverlap){
                printf("Enabled.\n");
            }
            else{
                printf("Disabled.\n");
            }
        printf("Kernel Execution Timeout:\t");
            if(prop.kernelExecTimeoutEnabled){
                printf("Enabled.\n");
            }
            else{
                printf("Disabled.\n");
            }
        printf("\n");

        printf("Memory information for device %d\n", i);
        printf("Total Global Memory:\t%ld\n", prop.totalGlobalMem);
        printf("Total Constant Memory:\t%ld\n", prop.totalConstMem);
        printf("Maximum Memory Pitch:\t%ld\n", prop.memPitch);
        printf("Texture Alignment:\t%ld\n", prop.textureAlignment);
        printf("\n");

        printf("Multi Processor Information for device %d\n", i);
        printf("Multiprocessor Count:\t%d\n", prop.multiProcessorCount);
        printf("Shared Memory for MP:\t%ld\n", prop.sharedMemPerBlock);
        printf("Registers for MP:\t%ld\n", prop.regsPerBlock);
        printf("Threads in warp:\t%d\n", prop.warpSize);
        printf("Maxmimum threads per block:\t%d\n", prop.maxThreadsPerBlock);
        printf("Maxmimum threads dimensions:\t(%d,%d,%d)\n",
                prop.maxThreadsDim[0], prop.maxThreadsDim[1], prop.maxThreadsDim[2]);
        printf("Max Grid Dimensionss:\t(%d,%d,%d)\n",
                prop.maxGridSize[0],prop.maxGridSize[1],prop.maxGridSize[2]);
    }

    return 0;
}
