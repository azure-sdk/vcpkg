vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF acf8926bb34f58aac5ca0756413947b35c5e8168
    SHA512 0fa2adb2c36630e05a2483094b3f6768412a46e397a4b930f4cacbfadf8dbaecba6729aa430147349f7f955c6b7c19d6ae685d2a64e6a6d7cf2bcd35b629e661
)

if(EXISTS "${SOURCE_PATH}/sdk/eventhubs/azure-messaging-eventhubs")
  file(REMOVE_RECURSE "${SOURCE_PATH}/sdk/eventhubs/_")
  file(REMOVE_RECURSE "${SOURCE_PATH}/sdk/_")
  file(REMOVE_RECURSE "${SOURCE_PATH}/_")

  file(RENAME "${SOURCE_PATH}/sdk/eventhubs/azure-messaging-eventhubs" "${SOURCE_PATH}/sdk/eventhubs/_")
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
