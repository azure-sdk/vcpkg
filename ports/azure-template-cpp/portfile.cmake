vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 68e9dc9ecb6980e04a5f779c806e97f8becae974
    SHA512 ace6a5ec120e2eaed3f7d3cbb8dd32ccb4833353122bcb8a64c86947c8093fa14be08841bccd900032d559b2f550c68cdca0f33e2e4c1f8d7c2dc6560d857fcf
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
