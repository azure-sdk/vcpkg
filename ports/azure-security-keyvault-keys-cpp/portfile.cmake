vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF f1de8d20df20f3edbfab5f3848037fa615178765
    SHA512 25b0ff3da21b93355d57999d8418acb2250aa6d52d190e9e6507d207607527715bb534e766a0466047d78c2776f6c783c6cc451243147cf2738d6700a87a8588
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/keyvault/azure-security-keyvault-keys/
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
