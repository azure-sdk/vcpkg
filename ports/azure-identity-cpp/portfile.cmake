vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 3e2e5a6dfc54fa0f4c5fdfa9de379147f43cd20d
    SHA512 f3c6d687ae073bda522b7519164eddb5ed638ba56be2ebd0c3a06b8e9cf91c0c425ad564ae9d4ca117d054bd17061abdbed442f4c5efb914c99d279b46c9c8d1
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
