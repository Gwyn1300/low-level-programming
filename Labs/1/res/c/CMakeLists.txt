cmake_minimum_required(VERSION 3.12)
# ИСПРАВЛЕНО: переключили проект с CXX на чистый C
project("low_level_prog" C)

# ИСПРАВЛЕНО: задаем стандарт C11 вместо C++20
set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)

if(CMAKE_C_COMPILER_ID STREQUAL "AppleClang" OR
   CMAKE_C_COMPILER_ID STREQUAL "Clang" OR
   CMAKE_C_COMPILER_ID STREQUAL "GNU")
   # ИСПРАВЛЕНО: убран флаг "-Weffc++", который ломает сборку Си-кода
   add_compile_options("-Wall" "-Wextra" "-Wpedantic")
elseif(CMAKE_C_COMPILER_ID STREQUAL "MSVC")
  if(CMAKE_C_FLAGS MATCHES "/W[0-4]")
    string(REGEX REPLACE "/W[0-4]" "" CMAKE_C_FLAGS ${CMAKE_C_FLAGS})
  endif()
  add_compile_options("/W4" "/utf-8")
endif()

# ИСПРАВЛЕНО: если у тебя первая лабораторная, то подключаем Lab1
add_executable(lab1 
simple_prog.c)