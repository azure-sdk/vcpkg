vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 5ea89474e711e4f332a179bd83807b35c673bce6
    SHA512 616cb4224290df66a2d28e6b489a4769af3421a93cb8e5f4180d9b2b1fae94a2376558574cf409d06d706e3f3eaf9f4916889258c7885cac63963a0ac24bed6c
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/sdk/identity/azure-identity/"
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
        -DBUILD_TESTING=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
