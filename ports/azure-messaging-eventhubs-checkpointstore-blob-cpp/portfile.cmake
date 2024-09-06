# NOTE: All changes made to this file will get overwritten by the next port release.
# Please contribute your changes to https://github.com/Azure/azure-sdk-for-cpp.

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 10025fd2a24060e81a1c9225dc1c38934ce4dd7e
    SHA512 df056b42e455ce8a9c193c8f3f49256fbf3f796151ed3995ae0e8caaa6d518b388c7e7061bfec5ab405f9d5edcfb4597e876621a56705c4eee55619faa926bf2
    HEAD_REF main
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
