cmake_minimum_required(VERSION 3.13)

project(ford_docs
        DESCRIPTION "Demonstrate Ford documentation"
        LANGUAGES Fortran)

# Not using find_package, hence comment out
# include(FindPkgConfig)

option(ENABLE_DOCS "Enable documentation" OFF)

if (${ENABLE_DOCS} STREQUAL "FORD")
   # Requires FindFord.cmake in the CMAKE_MODULE_PATH
   # find_package(Ford REQUIRED)

   find_program(FORD ford REQUIRED)
   set(ford_output "documentation/ford")
   file(MAKE_DIRECTORY ${ford_output})
   message("-- Ford documentation support enabled.")

   # Runs at compile time
   add_custom_target(docs
                     COMMAND ${FORD} -o ${ford_output} ${PROJECT_SOURCE_DIR}/project-description.md
		      )
 
elseif (${ENABLE_DOCS} STREQUAL "DOXYGEN")
   find_program(DOXYGEN doxygen REQUIRED)
   message("-- Doxygen documentation support enabled.")
   set(doxy_output "documentation/doxy")
   file(MAKE_DIRECTORY ${doxy_output})
   add_custom_target(docs
                     COMMAND ${DOXYGEN} ${PROJECT_SOURCE_DIR}/Doxyfile
		     )

else()
   message(WARNING "--ENABLE_DOCS choice not recognised.")

endif ()

set(CMAKE_Fortran_BIN_DIRECTORY ${PROJECT_BINARY_DIR}/bin)
set(CMAKE_Fortran_LIB_DIRECTORY ${PROJECT_BINARY_DIR}/lib)
set(CMAKE_Fortran_MODULE_DIRECTORY ${PROJECT_BINARY_DIR}/modules)

add_executable(main_exe)

target_sources(main_exe
        PRIVATE
        src/main.F90
	src/kinds.f90
	src/routines.f90
        )


# Forces documentation to be built before main exe
#add_dependencies(main_exe docs)
