install(
    TARGETS emulator_exe
    RUNTIME COMPONENT emulator_Runtime
)

if(PROJECT_IS_TOP_LEVEL)
  include(CPack)
endif()
