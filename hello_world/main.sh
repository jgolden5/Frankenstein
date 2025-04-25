#!/bin/bash
main() {
  declare -a languages=("bash" "c" "c++" "haskell" "java" "javascript" "python" "swift")
  for language in ${languages[@]}; do
    run_language_in_3_seconds "$language"
  done
}

run_language_in_3_seconds() {
  current_language="$1"
  echo -n "running $current_language ... "
  time run_language "$current_language"
}

run_language() {
  case "$1" in
    bash)
      run_bash
      ;;
    c)
      run_c
      ;;
    "c++")
      run_cpp
      ;;
    haskell)
      run_haskell
      ;;
    java)
      run_java
      ;;
    javascript)
      run_javascript
      ;;
    python)
      run_python
      ;;
    swift)
      run_swift
      ;;
  esac
}

run_bash() {
  ./hello_world.sh
}

run_c() {
  gcc hello_world.c -o c_hello_world_temp
  ./c_hello_world_temp
  rm c_hello_world_temp
}

run_cpp() {
  g++ hello_world.cpp -o cpp_hello_world_temp
  ./cpp_hello_world_temp
  rm cpp_hello_world_temp
}

run_haskell() {
  runghc hello_world.hs
}

run_java() {
  javac HelloWorld.java
  java HelloWorld
  rm HelloWorld.class
}

run_javascript() {
  node helloWorld.js
}

run_python() {
  python3 hello_world.py
}

run_swift() {
  swift helloWorld.swift
}

main
