vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF a4a24fbd391cf2542c6ad240d50a926315fb4642
    SHA512 227c1b05e90fdaefda20cd241aac01483e63bacb72fb9e515cea29562da9495f486709c16ce81a54d4f84d5f4d3ede05d2f59dcb7980c391698928a660dc54d8
)

if(EXISTS "${SOURCE_PATH}/sdk/eventhubs/azure-messaging-eventhubs-checkpointstore-blob")
  file(REMOVE_RECURSE "${SOURCE_PATH}/sdk/eventhubs/_")
  file(REMOVE_RECURSE "${SOURCE_PATH}/sdk/_")
  file(REMOVE_RECURSE "${SOURCE_PATH}/_")

  file(RENAME "${SOURCE_PATH}/sdk/eventhubs/azure-messaging-eventhubs-checkpointstore-blob" "${SOURCE_PATH}/sdk/eventhubs/_")
  file(RENAME "${SOURCE_PATH}/sdk/eventhubs" "${SOURCE_PATH}/sdk/_")
  file(RENAME "${SOURCE_PATH}/sdk" "${SOURCE_PATH}/_")
endif()

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/_/_/_"
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
        -DBUILD_TESTING=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
