# NOTE: All changes made to this file will get overwritten by the next port release.
# Please contribute your changes to https://github.com/Azure/azure-sdk-for-cpp.

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF c42e03e570cd9e7a6d49198a1d13ae8414cc0603
    SHA512 e3c2e81aa988973364633f688618c504e4642932ebe3de469a30e7ad4397ed9afc11718005c5248f9e280181ff8933ac4bddfd3df350efb7ede681a0c1efac4f
)

if(EXISTS "${SOURCE_PATH}/sdk/identity/azure-identity")
  file(REMOVE_RECURSE "${SOURCE_PATH}/sdk/identity/_")
  file(REMOVE_RECURSE "${SOURCE_PATH}/sdk/_")
  file(REMOVE_RECURSE "${SOURCE_PATH}/_")

  file(RENAME "${SOURCE_PATH}/sdk/identity/azure-identity" "${SOURCE_PATH}/sdk/identity/_")
  file(RENAME "${SOURCE_PATH}/sdk/identity" "${SOURCE_PATH}/sdk/_")
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
