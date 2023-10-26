# CUDA_CXX_TEMPLATE
关于CUDA和CXX结合在一起的项目模板

# 项目结构

```

├── build
├── CMakeLists.txt
├── cuda
│   └── cuda_process.cu
├── include
│   └── cuda_process.h
├── README.md
└── src
    └── main.cpp


```

cuda_process.cu 实现 cuda_process.h中的方法，同时main.cpp通过cuda_process.h定义的接口调用cuda算子。

CMakeLists.txt中有两种使用模式：静态链接和动态链接
主要思路是将CUDA代码打包成静态库`*.a`文件或者打包成动态库`.so`文件

然后在编译CPP文件时，将其作为三方包依赖进去，形成完整的程序