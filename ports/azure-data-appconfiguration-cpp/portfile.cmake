# NOTE: All changes made to this file will get overwritten by the next port release.
# Please contribute your changes to https://github.com/Azure/azure-sdk-for-cpp.

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 230b536e71e88cf1fe7c2a64a0583f94949bc142
    SHA512 dfe57dcf21b71d1c2d6e891ae9d755cc5f210ccdeccc9ed454753f8e77c250dd605fec742e7d71224c2a0ffed6e4072589c9ac338546a0fdb92454e2a835d189
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
