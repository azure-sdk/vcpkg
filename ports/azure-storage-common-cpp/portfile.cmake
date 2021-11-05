vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 34fe4dcfb9a4eb748e146a44baabcee0f3ba94d5
    SHA512 27ca2505eb483f71b0f43220a75595da61023a02f70df14c7a1e16d6f117220cf7557bce81a4de4cad630d21f5b7d6a151ae35226813e6bbbb1cc97e73742c95
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/storage/azure-storage-common/
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
