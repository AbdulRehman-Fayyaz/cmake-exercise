# Let's Fight With CMake, Docker, and Some Dependencies
# CMake Exercise: Dependency Management with Docker

This repository contains the solution for the CMake exercise. It demonstrates how to manage complex C++ dependencies (Deal.II, MPI, PETSc, Trilinos, TBB, Boost, and yaml-cpp) using a reproducible Docker environment.

## Overview

The project compiles a C++ application that performs:
1.  **FEM Simulation:** Solves a Poisson problem using Deal.II.
2.  **Flatset Manipulation:** Uses Boost Container.
3.  **Filesystem Inspection:** Uses Boost Filesystem.
4.  **YAML Parsing:** Uses a manually built version of `yaml-cpp`.

## Prerequisites

- Docker

## How to Build and Run

1.  **Build the Docker Image:**
    ```bash
    docker build -t cmake-exercise .
    ```

2.  **Run the Container:**
    ```bash
    # Linux/Mac
    docker run -it -v $(pwd):/cmake-exercise cmake-exercise bash
    
    # Windows PowerShell
    docker run -it -v ${PWD}:/cmake-exercise cmake-exercise bash
    ```

3.  **Compile and Run (inside the container):**
    The repository includes a helper script to build and execute the program:
    ```bash
    ./build_and_run.sh
    ```

4.  **Test YAML Parser:**
    To manually test the YAML parser functionality:
    ```bash
    ./build/main yamlParser/config.yml
    ```

## Dependencies

The `Dockerfile` handles the installation of:
- `build-essential`, `cmake`, `git`, `wget`, `unzip`, `vim`
- `libboost-all-dev`
- `libdeal.ii-dev`
- `mpi-default-dev`
- `libkokkos-dev`
- `libtrilinos-*` packages
- `libpetsc-real-dev`
- `libtbb-dev`
- `yaml-cpp` (v0.6.3 built from source)


Repository for the [CMake exercise](https://github.com/Simulation-Software-Engineering/Lecture-Material/blob/main/03_building_and_packaging/cmake_exercise.md).