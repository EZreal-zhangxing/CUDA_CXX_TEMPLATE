cmake_minimum_required(VERSION 3.10)

project(CUDA_APP)

find_package(CUDA REQUIRED)

message(STATUS "project source DIR : ${PROJECT_SOURCE_DIR}")
# message(STATUS "cuda info :")
# message(STATUS " -- cuda dir : ${CUDA_TOOLKIT_ROOT_DIR}")
# message(STATUS " -- cuda library : ${CUDA_TOOLKIT_ROOT_LIBRARY}")
# message(STATUS " -- cuda include : ${CUDA_TOOLKIT_ROOT_INCLUDE}")

file(GLOB HEADERS ${PROJECT_SOURCE_DIR}/include/*.h)

file(GLOB CUDA_SRC ${PROJECT_SOURCE_DIR}/cuda/*.cu)

message(STATUS "CUDA_SRC list: ${CUDA_SRC}")

file(GLOB CXX_SRC ${PROJECT_SOURCE_DIR}/src/*.cpp)

message(STATUS "CXX_SRC list: ${CXX_SRC}")

include_directories(./include)

# 动态库方法
cuda_add_library(gpu_kernal SHARED ${CUDA_SRC}) # 动态库 用target_link_libraries
add_executable(main ${CXX_SRC})
target_link_libraries(main gpu_kernal)

# 静态库方法
# cuda_add_library(gpu_kernal STATIC ${HEADERS} ${CUDA_SRC}) # 动态库 用 link_libraries
# link_directories(./build)
# link_libraries(gpu_kernal)
# add_executable(main ${CXX_SRC})