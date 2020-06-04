cmake_minimum_required(VERSION 3.15)


add_executable(nix-test main.cpp)
install(TARGETS nix-test
  RUNTIME DESTINATION bin)
