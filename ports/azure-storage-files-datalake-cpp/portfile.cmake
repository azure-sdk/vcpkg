vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 0ae33665d2a60b5f11083e8859c45181a6441239
    SHA512 5aa50b0f1abcd409e2d7787589d939b558ae3e74ca970c606e71003e7b6d38ed08020454593df48330ea50b710c9e0a4aeba2a690a9d37d142e7dc135d1423d8
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/storage/azure-storage-files-datalake/
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
