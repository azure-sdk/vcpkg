vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 96c4b5d5a1efe3ba5e4eafe9a86cf2b061e64b65
    SHA512 6e23451572e81569eaa95b6364486af8f94f1f99a2e39f96cb57c951064ffcda9126d112699501851946c7a07e535e6f61b6dc47803d75fc6c93881469712fb4
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/sdk/keyvault/azure-security-keyvault-certificates/"
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
