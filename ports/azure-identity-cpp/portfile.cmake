vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 0874e1c1c9047b9ccf6caac5057f67c9b92144a7
    SHA512 9fc2f423e0701c7ba26bd80c0066d13af2aa7e46929284a3f5428ddc5de2067f00b2149b442bb25a9fba212168e8e6f05a11e5ab6f8eeb7985e0a4a70e1ee1ef
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
