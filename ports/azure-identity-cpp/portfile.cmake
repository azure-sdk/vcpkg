vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 2f32786171ab6bac4a29b09f9dfe1ab760ceb74e
    SHA512 b5aade6cde5c6c599b6d7427f1a4f2d14ae9c670a85d5e3e3182ce35f8f28ba9ab62da8696f12b6aee49aba84d746e6b5834e23aa1ea1be1d0e2e2354ca31d93
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
