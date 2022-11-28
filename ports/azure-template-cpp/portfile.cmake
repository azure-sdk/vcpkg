vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 928c9cf6ebf0c405bf4686230a9f138c8644ba6b
    SHA512 3a6aa6e8513ec89f64fbeb0011e0ed6f1b331cc69e8c25523f937c6ce0211b9e2600f8f61228a339982afcdff2015774ff4d75bf19cbdd74bdae49dfcf0fc7c8
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/template/azure-template/
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
