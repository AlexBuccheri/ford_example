# ReadMe

## Installation

Ford can be installed with pip. One has to make sure Markdown is also up-to-date. Additionally, graphviz is required for the generation of dependency graphs:

`pip install ford Markdown graphviz`.  

Doxygen is available with most package managers i.e. macports, apt-get.


## Compiling the Documentation with CMake

To configure CMake with Ford support and compile the documentation:   

```
mkdir build && cd build
cmake ../ -DENABLE_DOCS=FORD  
make docs
```

To configure CMake with doxygen support and compile the documentation:   
```
mkdir build && cd build
cmake ../ -DENABLE_DOCS=DOXYGEN  
make docs
```

CMake will execute the appropriate command to generate the documentation. Ford documentation is built in `documentation/ford`, and doxygen documentation is built in `documentation/doxy`. In both cases, the html file can be loaded by double-clicking `index.html `


## Compiling the Documentation Manually

For Ford, run the following command in the root folder:

`ford -o documentation/ford project-description.md`.

For Doxygen, one needs to modify the file paths in the `Doxyfile` file because they're relative and cannot be passed to `doxygen` as arguments. They're set to work with the expected location of the CMake build directory by default. One should change the variables to:

```
INPUT                  = ./src
OUTPUT_DIRECTORY       = ./documentation/doxy
```

Once modified, run the following command in the root folder:
`doxygen Doxyfile`.

If the Doxygen configuration file is missing, one can also run:
`doxygen -g`,  
to generate a configuration file, which can then be modified accordingly.





