vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 42017bf69e71ee9dc82ba9c3e61ccc76581bb778
    SHA512 1e8a2c7cdc399d71e5bf67b730e4a2b4e0e7d7ae2b4c853529162b2e684d2e67c3d1e22c33cd29a79665a6b52f626b8ae0ae7ce88e33763a8bd71aedf62b2612
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/sdk/template/azure-template/"
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
