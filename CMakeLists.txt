cmake_minimum_required(VERSION 3.21)

include(cmake/prelude.cmake)

project(
    emulator
    VERSION 0.1.0
    DESCRIPTION "Cortex-M0 emulator written in C"
    HOMEPAGE_URL "https://example.com/"
    LANGUAGES C
)

include(cmake/variables.cmake)

# ---- Declare library ----

add_library(
    emulator_lib OBJECT
    source/lib.c
)

target_include_directories(
    emulator_lib ${warning_guard}
    PUBLIC
    "\$<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/source>"
)

target_compile_features(emulator_lib PUBLIC c_std_23)

# ---- Declare executable ----

add_executable(emulator_exe source/main.c)
add_executable(emulator::exe ALIAS emulator_exe)

set_property(TARGET emulator_exe PROPERTY OUTPUT_NAME emulator)

target_compile_features(emulator_exe PRIVATE c_std_23)

target_link_libraries(emulator_exe PRIVATE emulator_lib)

# ---- Install rules ----

if(NOT CMAKE_SKIP_INSTALL_RULES)
  include(cmake/install-rules.cmake)
endif()

# ---- Developer mode ----

if(NOT emulator_DEVELOPER_MODE)
  return()
elseif(NOT PROJECT_IS_TOP_LEVEL)
  message(
      AUTHOR_WARNING
      "Developer mode is intended for developers of emulator"
  )
endif()

include(cmake/dev-mode.cmake)
