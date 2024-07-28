cmake_minimum_required(VERSION 3.20)

project(cpp-standard-library LANGUAGES CXX)

file(GLOB SOURCES "src/*.cc")

add_executable(cpp-standard-library ${SOURCES})
