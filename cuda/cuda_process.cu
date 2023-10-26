#include "cuda_process.h"

__global__ void print_hello(){
    printf("hello world from gpu block Idx [%d,%d,%d],thread Idx [%d,%d,%d]\n",blockIdx.x,
        blockIdx.y,blockIdx.z,threadIdx.x,threadIdx.y,blockIdx.z);    
}

/**
 * implement method in cuda_process.h
*/
void print_on_gpu(){
    dim3 block(2,2);
    dim3 grid(5,5);
    print_hello<<<grid,block>>>();
    cudaDeviceReset();
}