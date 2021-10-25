vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF f90ab8a9b58b9b2050aedd4faf4394604517d5dd
    SHA512 cd3b472babadf60e0c734d2ee1524a1ee91e1d4e3f65d3e6ee61d2d758ff2ae54586e059963e02934baf3eaf32a7b4d34e360a35e24bae9f049656ff0d441cb4
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
