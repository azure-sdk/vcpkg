vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 111776e6af7fdfc0601e5c55bd560a803ec491e3
    SHA512 00e2d2c1f367e90aa42f49b93011c0f37742996cfeaf3fe66fef0fd468e4f2390244254fd8b066a3bf1f9418b7af715593f9a2e9cb6314ab9d1940d8fba9bdd0
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
