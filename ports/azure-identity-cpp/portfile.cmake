vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF bbf6c9c3ee5816de43a9ab0683ead222d01f8dbf
    SHA512 ccb6f98fa09f24b0cae49d860d4368ef17fb7a3c6b2dd531c122a7f82da9981c4e7f6d676bf614828f17e950d9b82536498882496ec4f0bdb621f2e9b7df4e2d
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/sdk/identity/azure-identity/"
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
        -DBUILD_TESTING=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
