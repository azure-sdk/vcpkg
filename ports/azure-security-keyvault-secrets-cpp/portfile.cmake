vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 60a805770d9d9576558a02ca53d989a2226b9f95
    SHA512 9f030bd21bd7e0a8002ceed24fab101c3d8f9ddf9a1dce9e4e41f1c49977d42f4ebee3599aa3bc7d483776255758ac644b8813e25ae8f4c1ab5fb2baf9a45a9a
)

if(EXISTS "${SOURCE_PATH}/sdk/keyvault/azure-security-keyvault-secrets")
  file(REMOVE_RECURSE "${SOURCE_PATH}/sdk/keyvault/_")
  file(REMOVE_RECURSE "${SOURCE_PATH}/sdk/_")
  file(REMOVE_RECURSE "${SOURCE_PATH}/_")

  file(RENAME "${SOURCE_PATH}/sdk/keyvault/azure-security-keyvault-secrets" "${SOURCE_PATH}/sdk/keyvault/_")
  file(RENAME "${SOURCE_PATH}/sdk/keyvault" "${SOURCE_PATH}/sdk/_")
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
