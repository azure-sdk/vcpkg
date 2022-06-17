vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 61636bba41ca52d22ac9205b203153b27a1a5a94
    SHA512 208ac4b48b0c3e1bc57f0fcc44977e81855a191c3825859df1db4e37f5dd0d78f73050ef45c577457ef4aaf9e364ccc7876774430cb74bc7fe60de61b669c848
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
