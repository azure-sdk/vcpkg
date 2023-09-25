vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 744450472d958916875a7a4d2c93f3ac148b8597
    SHA512 3e02432a0745209d89b777083a7df9ba6e9a5cb779c613cb8143a97a08c947834e242230877d63aef7f0bdf931f1035837d87ab1891236ea3e11739b46d82764
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
