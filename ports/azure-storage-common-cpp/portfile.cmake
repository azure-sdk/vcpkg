vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 7f6930678ca6dce3cd1fe75428a465388b7314e8
    SHA512 5f46080a6b553e02772256c3dd81b68d9ccce73fec7a7b312cd39e941f2bbc6c113ef3589423c9d4ae76d8c9097222b93cc29eb10866360cb79ad89bc85ac9c7
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
