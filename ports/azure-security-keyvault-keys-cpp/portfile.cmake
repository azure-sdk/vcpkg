vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF ccddc7f3ed7f0c71ad99a2d01398fcd3aa6596d7
    SHA512 84e32115d8fc14eb0a7682984a19bfea7568e24c3e8e044871300871774b98654c6adce3cb113342da85e0d5b631c58de2045a9fc44d4372967c754dacd80eec
)

if(EXISTS "${SOURCE_PATH}/sdk/keyvault/azure-security-keyvault-keys")
  file(REMOVE_RECURSE "${SOURCE_PATH}/sdk/keyvault/_")
  file(REMOVE_RECURSE "${SOURCE_PATH}/sdk/_")
  file(REMOVE_RECURSE "${SOURCE_PATH}/_")

  file(RENAME "${SOURCE_PATH}/sdk/keyvault/azure-security-keyvault-keys" "${SOURCE_PATH}/sdk/keyvault/_")
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
