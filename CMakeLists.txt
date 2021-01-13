cmake_minimum_required(VERSION 3.13)

project(ford_docs
        DESCRIPTION "Demonstrate Ford documentation"
        LANGUAGES Fortran)

include(FindPkgConfig)

option(ENABLE_DOCS "Enable documentation" OFF)

if (${ENABLE_DOCS} STREQUAL "FORD")
   find_package(Ford REQUIRED)
endif ()


set(CMAKE_Fortran_BIN_DIRECTORY ${PROJECT_BINARY_DIR}/bin)
set(CMAKE_Fortran_LIB_DIRECTORY ${PROJECT_BINARY_DIR}/lib)
set(CMAKE_Fortran_MODULE_DIRECTORY ${PROJECT_BINARY_DIR}/modules)

add_executable(main_exe)

target_sources(main_exe
        PRIVATE
        src/main.F90
        )

target_link_libraries(main_exe
            PRIVATE
            ${Ford}
            )
