vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 4053591a3da260cb43b5ab9e616178f0cde921e6
    SHA512 f4d350bcd078c75e0783f8663a9d0d7e89e2f4bb6bafcdbe7ccebeb3772e5ad9dcc21b8baeab5b2d4e14b34fa5138f2724051592d500a02d711a0ee7b1ef0c8f
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/keyvault/azure-security-keyvault-keys/
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
