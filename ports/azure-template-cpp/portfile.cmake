vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 4ec0a342472193a316b44ed3a252c794858cb942
    SHA512 69f43854c6f207d0ca8cd60d0e8bb262c020c73e265f9c7c5b182bf13dc2e9b8e63be7af0fa5d3f279b8a6edc6688f7b953eff3755fa4dde3e16f2e97a2c4ef0
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
