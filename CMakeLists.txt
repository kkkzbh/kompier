cmake_minimum_required(VERSION 4.1)

set(CMAKE_EXPERIMENTAL_CXX_IMPORT_STD d0edc3af-4c50-42ea-a356-e2862fe7a444)

project(kompier LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 26)

add_executable(kompier
        main.cpp
)

set_target_properties(kompier PROPERTIES CXX_MODULE_STD ON)

target_sources(kompier
        PRIVATE
        FILE_SET CXX_MODULES FILES
        main.cppm
)