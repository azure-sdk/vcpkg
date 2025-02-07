# NOTE: All changes made to this file will get overwritten by the next port release.
# Please contribute your changes to https://github.com/Azure/azure-sdk-for-cpp.

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF c5b9a20dc9fafd5867c3ef2f656452880eeb2191
    SHA512 71ee88a82567e3cf94be64efaa72809bbb172887b81d0e989d1cc35f174df5c27c2f508c6ea2c4895ef51dfa62271f00675e7bf4d46b75a9d17162ffe42072e7
    HEAD_REF main
)

if(EXISTS "${SOURCE_PATH}/sdk/appconfiguration/azure-data-appconfiguration")
  file(REMOVE_RECURSE "${SOURCE_PATH}/sdk/appconfiguration/_")
  file(REMOVE_RECURSE "${SOURCE_PATH}/sdk/_")
  file(REMOVE_RECURSE "${SOURCE_PATH}/_")

  file(RENAME "${SOURCE_PATH}/sdk/appconfiguration/azure-data-appconfiguration" "${SOURCE_PATH}/sdk/appconfiguration/_")
  file(RENAME "${SOURCE_PATH}/sdk/appconfiguration" "${SOURCE_PATH}/sdk/_")
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
