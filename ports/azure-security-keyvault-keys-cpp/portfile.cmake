vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF cad69e1a8ce78ca3a42dbf45bb92b652d4763599
    SHA512 5146c9bb3736465900a161542661d1c91a5c2a067d708c89331b615288da18d156b35ea9fc41adfe766be7f15c671789ffd5cd174fe791f59bc3ba022a251421
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
