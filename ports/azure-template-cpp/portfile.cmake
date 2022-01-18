vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 20bb1ec276f384fffd62755a27fa1df172ad1703
    SHA512 1a08ee06405e848185ac2c40c3c4639aeeedbb982a209140b988bc627fb187b14dbcb8a381e07aa65625453aa6e747a71eeffa1b5f1116f6c2b2b49c093eb89f
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
