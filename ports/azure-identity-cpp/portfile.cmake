vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 72b87b58ec8170a89e9d7d9f4619ff207c1e45bf
    SHA512 1d41315bc0b986ba558ad708b42d5430915a3d94c4b3fadf3d24ed92b88a07e4ac087314c0c1b1dbf1802dcae9dfc225600c64bb87306e93ca2793a1fee59cf3
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/sdk/identity/azure-identity/"
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
