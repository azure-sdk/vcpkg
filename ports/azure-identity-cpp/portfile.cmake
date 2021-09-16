vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF bb8b889cf5cc4a6c4cc64c2761ee2bae975c22c3
    SHA512 4a4cde74902261f0127920bdec3a5ee175f74a103189bb97e15b02cd9c51029b52d468816bb17d1c209c9faf3fa129ce1e754c10aae6e7553a550c037ca30c9a
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
