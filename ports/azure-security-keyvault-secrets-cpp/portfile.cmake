vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 697f45a454a92271e1e988f3e5c07cd45ac3a0ab
    SHA512 f86580951273c64842443aa49020d335e76b7bda825b81bcfb069959c8a4f68971ccaec1e0e87ab36b016cdd84a5dcfa2cab2f3fb7d2b21832b2d9f4fb7fb5c6
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/keyvault/azure-security-keyvault-secrets/
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
