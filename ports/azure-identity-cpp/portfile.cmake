vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 5ad55ecb6e5a858d3756f21bb8ba5e728ed61f18
    SHA512 0e8fb2b5ce221f987599e25669e03d7d24855f6441dc22b7a2968a8d91d7ec030924fc8a00ef0a3b787025721ebb80d97d82e86b2fdbf767eb8de44c1aa93711
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/identity/azure-identity/
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
