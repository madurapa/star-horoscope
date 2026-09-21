cmake_minimum_required(VERSION 3.16)
project(modern_star C CXX)

# All binaries are 64-bit, on every platform (owner requirement).
if(NOT CMAKE_SIZEOF_VOID_P EQUAL 8)
  message(FATAL_ERROR "64-bit build required (got ${CMAKE_SIZEOF_VOID_P}-byte pointers)")
endif()

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

if(MSVC)
  add_compile_options(/W4 /O2)
else()
  add_compile_options(-Wall -Wextra -O2)
endif()

# Portable standalone binary: fully static link (needs static libc/dl on
# the build machine). Off by default; the standard build stays dynamic.
option(STAR_PORTABLE "Fully static portable modern_star binary (Linux)" OFF)
if(STAR_PORTABLE AND NOT MSVC)
  add_link_options(-static)
endif()
if(STAR_PORTABLE AND MSVC)
  # Static CRT so star.exe runs with no Visual C++ redistributable.
  set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>")
endif()

add_executable(modern_star src/main.cpp src/CLI.cpp src/VargaEngine.cpp src/SwissFeed.cpp)
target_include_directories(modern_star PRIVATE src third_party/swisseph)
target_link_libraries(modern_star PRIVATE swisseph)
if(STAR_PORTABLE AND NOT MSVC)
  target_link_libraries(modern_star PRIVATE dl)
endif()

# Third-party: Swiss Ephemeris C library (Phase-2 engine feed; see
# third_party/swisseph/README). Vendored sources compile warnings-off;
# the zero-warning gate applies to our code, not upstream's.
add_library(swisseph STATIC
  third_party/swisseph/swecl.c
  third_party/swisseph/swedate.c
  third_party/swisseph/swehel.c
  third_party/swisseph/swehouse.c
  third_party/swisseph/swejpl.c
  third_party/swisseph/swemmoon.c
  third_party/swisseph/swemplan.c
  third_party/swisseph/sweph.c
  third_party/swisseph/swephlib.c)
target_include_directories(swisseph PUBLIC third_party/swisseph)
if(MSVC)
  target_compile_options(swisseph PRIVATE /w)
else()
  target_compile_options(swisseph PRIVATE -w)
  target_link_libraries(swisseph PUBLIC m)
  if(CMAKE_SYSTEM_NAME STREQUAL "Linux")
    target_link_libraries(swisseph PUBLIC dl)  # sweph.c dladdr (cf. upstream LIBS)
  endif()
endif()

function(add_star_test name)
  add_executable(${name} tests/${name}.cpp src/VargaEngine.cpp src/SwissFeed.cpp)
  target_include_directories(${name} PRIVATE src third_party/swisseph)
  target_link_libraries(${name} PRIVATE swisseph)
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
add_star_test(test_slot_names)
add_star_test(test_swiss_engine)
add_star_test(test_swiss_anchors)
add_star_test(test_swiss_goldens)
add_star_test(test_swisseph_smoke)
target_include_directories(test_swisseph_smoke PRIVATE third_party/swisseph)
target_link_libraries(test_swisseph_smoke PRIVATE swisseph)
add_star_test(test_sunrise)
add_star_test(test_attributes)
add_star_test(test_attributes_data)
add_star_test(test_hora_chain)
add_star_test(test_karana_data)
add_star_test(test_locale)
add_star_test(test_json_schema)
add_star_test(verifier)
# CLI validation test links the CLI translation unit.
add_executable(test_cli_valid tests/test_cli_valid.cpp src/CLI.cpp src/VargaEngine.cpp src/SwissFeed.cpp)
target_include_directories(test_cli_valid PRIVATE src third_party/swisseph)
target_link_libraries(test_cli_valid PRIVATE swisseph)
add_test(NAME test_cli_valid COMMAND test_cli_valid WORKING_DIRECTORY ${CMAKE_SOURCE_DIR})
# CLI config test links the CLI translation unit.
add_executable(test_cli_config tests/test_cli_config.cpp src/CLI.cpp src/VargaEngine.cpp src/SwissFeed.cpp)
target_include_directories(test_cli_config PRIVATE src third_party/swisseph)
target_link_libraries(test_cli_config PRIVATE swisseph)
# Mechanized extraction smoke check + data-driven corpus runner.
add_test(NAME test_cli_config COMMAND test_cli_config WORKING_DIRECTORY ${CMAKE_SOURCE_DIR})
add_star_test(test_modern_display)
# Mechanized extraction smoke check + data-driven corpus runner.
add_test(NAME extraction_check COMMAND python3 tools/check_extraction.py
         WORKING_DIRECTORY ${CMAKE_SOURCE_DIR})
add_test(NAME corpus COMMAND python3 tools/corpus_run.py
         WORKING_DIRECTORY ${CMAKE_SOURCE_DIR})

# Python bindings (nanobind, Phase 4 consumer): strictly optional, off by
# default so the gate stays dependency-free. Needs Python 3.9+ dev headers
# and pip-installed nanobind in the selected interpreter.
option(STAR_PYTHON "Build nanobind pystar module" OFF)
if(STAR_PYTHON)
  # nanobind 3.x wants the unversioned FindPython module (not FindPython3).
  # Point it at 3.9+ via -DPython_EXECUTABLE=/usr/bin/python3.13 if the
  # default interpreter is older.
  find_package(Python 3.9 REQUIRED COMPONENTS Interpreter Development)
  execute_process(
    COMMAND ${Python_EXECUTABLE} -m nanobind --cmake_dir
    OUTPUT_VARIABLE nanobind_DIR OUTPUT_STRIP_TRAILING_WHITESPACE
    RESULT_VARIABLE _nb_res)
  if(NOT _nb_res EQUAL 0)
    message(FATAL_ERROR "nanobind not importable in ${Python_EXECUTABLE} (pip install nanobind)")
  endif()
  find_package(nanobind CONFIG REQUIRED)
  # Shared modules need PIC objects out of the vendored C library.
  set_target_properties(swisseph PROPERTIES POSITION_INDEPENDENT_CODE ON)
  nanobind_add_module(pystar bindings/pystar.cpp src/CLI.cpp src/VargaEngine.cpp
                      src/SwissFeed.cpp)
  target_include_directories(pystar PRIVATE src third_party/swisseph)
  target_link_libraries(pystar PRIVATE swisseph)
  add_test(NAME test_pystar COMMAND ${Python_EXECUTABLE} ${CMAKE_SOURCE_DIR}/bindings/smoke.py
           WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR})
  set_tests_properties(test_pystar PROPERTIES ENVIRONMENT "PYTHONPATH=${CMAKE_CURRENT_BINARY_DIR}")
endif()
