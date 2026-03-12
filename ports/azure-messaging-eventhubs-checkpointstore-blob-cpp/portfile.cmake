# NOTE: All changes made to this file will get overwritten by the next port release.
# Please contribute your changes to https://github.com/Azure/azure-sdk-for-cpp.

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 4e29a27159166db5a408c91f0d63b87c9643a6a9
    SHA512 9c9228c5785dd6895856aa6e85dd1cfc65c2d9416fe0a05f11d2c6dcdf47b133ed7111a78bd6f7aa3e92da5ea634b838d30fa63f0e7239d9a2ee368b2922cc7c
    HEAD_REF main
)

file(GLOB_RECURSE unused "${SOURCE_PATH}/cgmanifest.json")
file(REMOVE_RECURSE ${unused})

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
