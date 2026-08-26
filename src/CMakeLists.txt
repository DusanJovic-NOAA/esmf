add_subdirectory(prologue)
add_subdirectory(Infrastructure)
add_subdirectory(Superstructure)
add_subdirectory(epilogue)
add_subdirectory(apps)
add_subdirectory(addon)

if(ENABLE_SYSTEM_TESTS)
  add_subdirectory(system_tests)
endif()

# add_subdirectory(test_harness)
# add_subdirectory(doc)
