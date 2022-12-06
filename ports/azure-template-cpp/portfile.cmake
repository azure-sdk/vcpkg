vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 5f93ee3d3ee5f0f8706b019e1d08af0199a51e53
    SHA512 fd929b033115dbc5bbbb6379664f0166721623c9af9f1b54d05ee55b9df10d4e3d03ff0ebebb58030c04d887e4f52e2222b314119b6b3dd71dce3cce29d8afd5
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
