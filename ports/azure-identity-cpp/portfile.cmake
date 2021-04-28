vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 1d5a7552873841938ecf9d3e1f17c722ecb1ca95
    SHA512 2e6cd51453d9383fc2d490f7ec98a8294b8485abba6f28dd3b5824e79fcf3eebfbf7d330c819721fce0396448627e5673a00e2d4c0aeeecb80f072aaf8f8649d
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/identity/azure-identity/
    PREFER_NINJA
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
