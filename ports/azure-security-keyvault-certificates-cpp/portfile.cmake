vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 1cd78c3dc2488502ff8e9af61cb067cbb4e83e7d
    SHA512 ce7d27e7d0d59152821d489c8816d93e7e802aabc626c316ca9bd2e0ed73eb10c3710daa1541edc75c5bc3b94fbb2f5c9b682b3c0b2238fa9f2fc1a8c3b51f35
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/keyvault/azure-security-keyvault-certificates/
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
