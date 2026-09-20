cmake_minimum_required(VERSION 3.16)
project(modern_star CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

add_compile_options(-Wall -Wextra -O2)

add_executable(modern_star src/main.cpp src/CLI.cpp src/VargaEngine.cpp)
target_include_directories(modern_star PRIVATE src)

function(add_star_test name)
  add_executable(${name} tests/${name}.cpp src/VargaEngine.cpp)
  target_include_directories(${name} PRIVATE src)
  add_test(NAME ${name} COMMAND ${name} WORKING_DIRECTORY ${CMAKE_SOURCE_DIR})
endfunction()

enable_testing()
add_test(NAME verify COMMAND modern_star --verify WORKING_DIRECTORY ${CMAKE_SOURCE_DIR})
add_star_test(test_boundaries)
add_star_test(test_ephemeris)
add_star_test(test_panchanga)
add_star_test(test_phase2)
add_star_test(test_shadvarga)
add_star_test(test_trishansa)
add_star_test(test_kendra)
add_star_test(test_properties)
add_star_test(test_sunrise)
add_star_test(test_attributes)
add_star_test(test_attributes_data)
add_star_test(test_hora_chain)
add_star_test(test_karana_data)
add_star_test(verifier)
# CLI validation test links the CLI translation unit.
add_executable(test_cli_valid tests/test_cli_valid.cpp src/CLI.cpp src/VargaEngine.cpp)
target_include_directories(test_cli_valid PRIVATE src)
add_test(NAME test_cli_valid COMMAND test_cli_valid WORKING_DIRECTORY ${CMAKE_SOURCE_DIR})
# CLI config test links the CLI translation unit.
add_executable(test_cli_config tests/test_cli_config.cpp src/CLI.cpp src/VargaEngine.cpp)
target_include_directories(test_cli_config PRIVATE src)
add_test(NAME test_cli_config COMMAND test_cli_config WORKING_DIRECTORY ${CMAKE_SOURCE_DIR})
add_star_test(test_modern_display)
# Mechanized extraction smoke check + data-driven corpus runner.
add_test(NAME extraction_check COMMAND python3 tools/check_extraction.py
         WORKING_DIRECTORY ${CMAKE_SOURCE_DIR})
add_test(NAME corpus COMMAND python3 tools/corpus_run.py
         WORKING_DIRECTORY ${CMAKE_SOURCE_DIR})
