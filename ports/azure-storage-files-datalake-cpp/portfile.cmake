vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 93c3a6298647f9e8bce1c34bb10597c69d1bb4b2
    SHA512 ad0c15e59f5421b3be812c4bfc5d197f7993ae7ecc5ef15f3a3add58cfecd2e2879be7e89ef38010e9c71f49dbe125f93ba22c236e05e2a1f414cdfcb22883d3
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/sdk/storage/azure-storage-files-datalake/"
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
