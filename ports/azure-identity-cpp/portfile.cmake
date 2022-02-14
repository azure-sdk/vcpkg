vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 269f1a3ca1833303a67e6f86fa59aa1659b4da6e
    SHA512 2fff5e7cc0f3214cd81dd359ecd2b92a2195e5ea4b0203b303e5dcf7983fcdd18bdee36b2fecdd83ccea5c3f78f767fae8cf5230d2bd44dfa53049e01b5ae3a1
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
