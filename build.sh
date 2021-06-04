#!/bin/bash

set -e
set -x

rm -rf build

mkdir build && pushd build

conan install .. --build=missing
# conan install .. --build missing -s compiler=gcc -s compiler.version=6.3 -s compiler.libcxx=libstdc++11
# conan install -s build_type=Release .. --build=missing

cmake .. -DCMAKE_BUILD_TYPE=Debug
# https://stackoverflow.com/questions/42162014/gtest-installed-with-conan-undefined-reference
# cmake .. -DCMAKE_BUILD_TYPE=Release
#cmake .. -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release

cmake --build .

bin/main


