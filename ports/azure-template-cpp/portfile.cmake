vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 1f8234059dc7ef05ee92215689cfdd565877798f
    SHA512 d5f9aa9cb165ed8a1ca2c35e8cf27898eaaf50f20696ab88806dc242d49f5f64e519f95044f14b0c3b62d9c5310afb6b6e48711ab37a64bf4a6b319c0f3b52de
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
