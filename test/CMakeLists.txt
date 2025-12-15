# Parent project does not export its library target, so this CML implicitly
# depends on being added from it, i.e. the testing is done only from the build
# tree and is not feasible from an install location

project(emulatorTests LANGUAGES C)

# ---- Tests ----

add_executable(emulator_test source/emulator_test.c)
target_link_libraries(emulator_test PRIVATE emulator_lib)
target_compile_features(emulator_test PRIVATE c_std_23)

add_test(NAME emulator_test COMMAND emulator_test)

# ---- End-of-file commands ----

add_folders(Test)
