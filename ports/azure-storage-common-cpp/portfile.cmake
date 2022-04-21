vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 229eb8a340330f6fd92d2575ad849791444b4964
    SHA512 fbd42190e2cfe14a71f75b425ac1b056e45746dd5a94ef3de36ed6b3964eaf1ad8e5cb2e376d2cebd39f75d448ae992c9325de902c52e1e04462b36b8d7b9cb8
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
