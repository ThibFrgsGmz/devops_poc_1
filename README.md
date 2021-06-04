# Dummy devops application

Example of a dummy application using Google Test installed with Conan C/C++ package manager.

## Compiling steps

1. Create a build directory:

    ```
    $ mkdir build && pushd build
    ```

2. Install dependencies (gtest):

    ```
    $ conan install .. --build=missing
    ```

3. Configure the CMake project:

    ```
    $ cmake .. -DCMAKE_BUILD_TYPE=Debug
    ```

4. Build it:

    ```
    $ cmake --build .
    ```

5. Run the application:

    ```
    $ bin/main
    ```
