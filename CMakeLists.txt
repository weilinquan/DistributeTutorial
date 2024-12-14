cmake_minimum_required(VERSION 3.20.0)

if(POLICY CMP0077)
  cmake_policy(SET CMP0077 NEW)
endif()

if(POLICY CMP0116)
  cmake_policy(SET CMP0116 OLD)
endif()
project(DistributeTutorial LANGUAGES CXX C)

find_package(MLIR REQUIRED CONFIG)
message(STATUS "Using MLIRConfig.cmake in: ${MLIR_DIR}")
message(STATUS "Using LLVMConfig.cmake in: ${LLVM_DIR}")

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

set(LLVM_MLIR_BINARY_DIR ${MLIR_DIR}/../../../bin)
set(LLVM_MLIR_LIBRARY_DIR ${MLIR_DIR}/../../../lib)
set(LLVM_MLIR_SOURCE_DIR ${MLIR_DIR}/../../../../mlir)
set(LLVM_PROJECT_BUILD_DIR ${MLIR_DIR}/../../../)
set(LLVM_PROJECT_SOURCE_DIR ${MLIR_DIR}/../../../../)

list(APPEND CMAKE_MODULE_PATH "${MLIR_CMAKE_DIR}")
list(APPEND CMAKE_MODULE_PATH "${LLVM_CMAKE_DIR}")

set(DISTRIBUTETUTORIAL_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR})
set(DISTRIBUTETUTORIAL_BUILD_DIR ${CMAKE_CURRENT_BINARY_DIR})
set(DISTRIBUTETUTORIAL_BINARY_DIR ${CMAKE_CURRENT_BINARY_DIR}/bin)
set(DISTRIBUTETUTORIAL_MIDEND_INCLUDE_Dialect_DIR ${DISTRIBUTETUTORIAL_SOURCE_DIR}/midend/include/Dialect)

find_program(LLVM_TABLEGEN_EXE "llvm-tblgen" ${LLVM_TOOLS_BINARY_DIR}
            NO_DEFAULT_PATH)

set(LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib)

include_directories(${LLVM_INCLUDE_DIRS})
include_directories(${MLIR_INCLUDE_DIRS})
include_directories(${CMAKE_CURRENT_BINARY_DIR}/midend/include/Dialect)
include_directories(${DISTRIBUTETUTORIAL_MIDEND_INCLUDE_Dialect_DIR})

list(APPEND CMAKE_MODULE_PATH ${MLIR_MAIN_SRC_DIR}/cmake/modules)
list(APPEND CMAKE_MODULE_PATH ${LLVM_MAIN_SRC_DIR}/cmake)

message(STATUS "Usin222g LLVMConfig.cmake in: ${CMAKE_MODULE_PATH}")

find_program(LLVM_TABLEGEN_EXE "llvm-tblgen" ${LLVM_TOOLS_BINARY_DIR} NO_DEFAULT_PATH)

include(TableGen)
include(AddLLVM)
include(AddMLIR)
include(HandleLLVMOptions)

add_subdirectory(midend)
add_subdirectory(tools)