vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF f8a1e7fc5c5ce55ffc86742339b966bf7cc5a7c2
    SHA512 5b75b606eac4660e1dde168fea0d79178040c63cc0d6425370cc93da597d277e3f96594b5c226061c620b4ec1b4671c42b34f102a7eb1b6331c94df2c3097d6c
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
