vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 70ec55f3655bb0e0def1ecd415dd08431f354fd5
    SHA512 bb4cc7a5a8b8fdb860e9b6768b996108c8a24d1389eb989bceed78e05bfc8c01619d25d3c3e8fb712fb9c9f0988f27c51a046bf7c0a09fd50eb440e26d0471c4
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/keyvault/azure-security-keyvault-secrets/
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
