vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF afaefd3d05d5a43f20cd1894a52f6a32f2bce5a0
    SHA512 8ad4136a1a842ef6a1d59bfaad0b0a518b965606ed15f9d0df0d04e1bd1ee651a8ff47a63a2fb33b7ce4ce745c92bddc5e45981689eaea539cd21b796d18a2f3
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
