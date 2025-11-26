FROM ubuntu:24.04

# Prevent interactive prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# Install all dependencies including the tricky ones (Trilinos, PETSc, TBB, MPI, Kokkos)
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    wget \
    unzip \
    vim \
    libboost-all-dev \
    libdeal.ii-dev \
    mpi-default-dev \
    libkokkos-dev \
    libtrilinos-epetra-dev \
    libtrilinos-epetraext-dev \
    libtrilinos-teuchos-dev \
    libtrilinos-aztecoo-dev \
    libtrilinos-amesos-dev \
    libtrilinos-ifpack-dev \
    libtrilinos-ml-dev \
    libpetsc-real-dev \
    libtbb-dev \
    && rm -rf /var/lib/apt/lists/*

# Manual install of yaml-cpp 0.6.3
WORKDIR /tmp
RUN wget https://github.com/jbeder/yaml-cpp/archive/refs/tags/yaml-cpp-0.6.3.zip
RUN unzip yaml-cpp-0.6.3.zip
RUN cd yaml-cpp-yaml-cpp-0.6.3 && \
    mkdir build && cd build && \
    cmake .. -DYAML_BUILD_SHARED_LIBS=ON && \
    make -j4 && \
    make install

# Set environment variables
ENV LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
WORKDIR /cmake-exercise