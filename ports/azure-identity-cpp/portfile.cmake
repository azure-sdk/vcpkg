vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 15a8a7b0da2e7b91e2a191d15649ce9836ac9af1
    SHA512 20015f4d1d5bf65db391fc0e45dc42e05d6e9239e4c1938df4c2fedbc3710d1ddf3cd0e43d4f172c558266fb68801fb00c8ad8bbb86973e3399287cb649a962a
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
