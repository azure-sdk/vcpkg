vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 504d9f2753e66b5cce2f6853807445af84f1ca5b
    SHA512 251e1df816aedc2416d9f1b66b2a8df99aaa0540cfddc4f3d1c3a567cb50950ea6247172fa579fbe068a3ade06449bab310ebdc118ec6131c29d635767ec78fb
)

if(EXISTS "${SOURCE_PATH}/sdk/core/azure-core-amqp")
  file(REMOVE_RECURSE "${SOURCE_PATH}/sdk/core/_")
  file(REMOVE_RECURSE "${SOURCE_PATH}/sdk/_")
  file(REMOVE_RECURSE "${SOURCE_PATH}/_")

  file(RENAME "${SOURCE_PATH}/sdk/core/azure-core-amqp" "${SOURCE_PATH}/sdk/core/_")
  file(RENAME "${SOURCE_PATH}/sdk/core" "${SOURCE_PATH}/sdk/_")
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
