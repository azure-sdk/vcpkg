vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 214f4a364eb7e536384368e1a7d319fbbc422c47
    SHA512 e43b891692f4f562dfbd113c4d80ce8afad9f94ce6f5bde56e7da3794a6251c31c40a5457e6538bcffacc26bbbabae9a0fbcbfcdf3d33e9ada905191483223b9
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
