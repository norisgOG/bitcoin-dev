cmake_minimum_required(VERSION 3.17)
project(base58)

set(CMAKE_CXX_STANDARD 14)

add_executable(base58 main.cpp base58.h base58.cpp)



add_subdirectory(test)

include_directories(compat)
include_directories(crypto)
include_directories(util)