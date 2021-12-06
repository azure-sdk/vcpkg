vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF aecfa8b92552157c555bc9dd75b4cd7ff7ec7707
    SHA512 ff0b4fd7f9d185bca0bbbbb2c2883e79934b88ffc5e1d1f6bb51fd59d745c3d4d922615f3021a42248dd437dbada815e261a52a2ce9af254454855c61ea79dc1
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
