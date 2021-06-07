#!/bin/bash

# The Set Builtin: https://www.gnu.org/software/bash/manual/bash.html#The-Set-Builtin

# Exit immediately if a pipeline which may consist of a single simple command,
# a list or a compound command returns a non-zero status.
set -e
# Print a trace of simple commands
set -x


# Delete the previous build directory to start fresh
rm -rf build

# Create a construction directory and go into it
mkdir build && pushd build

# Install the requirements specified in the recipe and build packages from source whose binary package is not found.
conan install .. --build=missing
# conan install .. --build missing -s compiler=gcc -s compiler.version=6.3 -s compiler.libcxx=libstdc++11
# conan install -s build_type=Release .. --build=missing

# Specify the type of construction (configuration) that will be built in this construction tree: debug
cmake .. -DCMAKE_BUILD_TYPE=Debug
# https://stackoverflow.com/questions/42162014/gtest-installed-with-conan-undefined-reference
# cmake .. -DCMAKE_BUILD_TYPE=Release
#cmake .. -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release

# Build the projet
cmake --build .

# Launch the app.
bin/main


