vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF bfaf27ce15d0697b680e9055f4010f3b4f0d1300
    SHA512 b6a4d6c030679c5cb89cf20ba3a9c1041a1f759e46ae3c31b04c5ff668b2fd60e151645028b19ce423ae63fd1e85b6802488d4fb002195834f7cc0149f48dd27
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/identity/azure-identity/
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
