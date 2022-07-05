vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 803dfb5938a2d15fbbf72015522ed59797b7bf6c
    SHA512 e561847d08f9e9f5c50c4bb3dd8135157c7d8e81410f91e2e1ce1cae683fcbaae225dda9a0e1835d349ad21f15930952a46f3726acc458b75e8f99beb8abb84e
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
