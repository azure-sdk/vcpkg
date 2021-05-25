vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 73d5ba0d2d541c5dde59fda50454f57ae8dbe7f0
    SHA512 8a2b72a56928a93016c5588cfac8653edabb591df035dfe6dfdd2cb33fc880f0f6314c3f93c39e2cc63ad74ebf857691b600183a6b6bc389512cafe7d6f10ccb
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/template/azure-template/
    PREFER_NINJA
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
