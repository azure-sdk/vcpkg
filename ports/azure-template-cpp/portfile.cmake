vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF e7747b4af91fe5f9f2192ecdf567e87fc32b1b70
    SHA512 c3c3297a0762733d9124b955a13a987e89912810b3a98e81bce1f3c942c540a53a3cd690291e44704422839cacedca321fd7baa3c5642c0d9003a6b5c5ce6370
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
