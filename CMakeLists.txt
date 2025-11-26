cmake_minimum_required(VERSION 3.16)
project(cmake_exercise)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# --- Find Dependencies ---
find_package(Boost REQUIRED COMPONENTS filesystem)
find_package(deal.II REQUIRED)
find_package(yaml-cpp REQUIRED)
find_package(MPI REQUIRED)
find_package(OpenMP REQUIRED)

# --- Define the Executable ---
add_executable(main 
    main.cpp
    flatset/flatset.cpp
    filesystem/filesystem.cpp
    fem/fem.cpp
    yamlParser/yamlParser.cpp
)

# --- Link Libraries ---
# 1. Setup deal.II (Handles Trilinos, PETSc, TBB, etc.)
deal_ii_setup_target(main)

# 2. Link other libraries (Using plain style to match deal.II)
target_link_libraries(main
    Boost::filesystem
    yaml-cpp
    MPI::MPI_CXX
    OpenMP::OpenMP_CXX
)

# --- Include Directories ---
target_include_directories(main PRIVATE 
    ${CMAKE_CURRENT_SOURCE_DIR}
    /usr/include/trilinos
    /usr/include/petsc
)