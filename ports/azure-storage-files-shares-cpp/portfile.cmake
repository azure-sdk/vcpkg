vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 61003a921e7babd3a429b40a4c60b726b48fa612
    SHA512 72cbbae922e0f8e73cbb6c67b1b59c3187078dfc972dbc1b7978bf7825892a6675bf9acd322c9d8c098712e0c26934001e21d74a205da52acd579ba75a72e7c4
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/sdk/storage/azure-storage-files-shares/"
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
