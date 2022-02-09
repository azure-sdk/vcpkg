vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 503a870c09ed29a3897d198477b2e590ca6c7a53
    SHA512 12d2a76171ca38f95a1b8117d593ddf4d39742740eb7f1ea080b258e8b89a0a7fce56bb40996dbcbb20613282654f943ba07633ebf0bc3a27d1067bccc161fe8
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
