vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF c6a00a97b408b4e9d950b3d8f4af2be85975f9a2
    SHA512 0324c01372a038d4ade509d6d6530041421ac048e4bae61a9a3a1b7e24d6cb1b141d59aafb2f930dff137cfdd08165b1f94f24a10cac6de148e7a9c5f0f756ef
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/storage/azure-storage-common/
    PREFER_NINJA
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
