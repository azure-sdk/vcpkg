vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF b809bf9883fe884e78c8aca0488c624cda9da12d
    SHA512 cf7f9e75dd4f0500f3c9a21305f5d26bf5f7648be9768f7a5db425cb40fda11e5ca7aa355f03a8a9e26d2998d190c140b5afcee8b117201cabff696a9411a596
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
