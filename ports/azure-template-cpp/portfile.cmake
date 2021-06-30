vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF f6ec0bd87f542b96f74df1e2b8d93708cc570f54
    SHA512 65c0f52bead6f4e09fd3dc5c697ef14d3e88b36fe5bebbf750e8d3ef3f0e8e0ff7e569a12c1c31654e14e6dec0ae405853d11f278cf033a33ba159d1285607c1
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
