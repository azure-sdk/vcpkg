vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 8c5dec33be89863c0e6aa37b69af45542b27fc88
    SHA512 41e9360b899dcaa12d41ce617c46e93ffbe250096dbafe74fe0b9d9343f0e5e3341770d357e82ed4f9a18c61bdcc767a24f4773a9b54a19137f8227e95b44eb1
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
