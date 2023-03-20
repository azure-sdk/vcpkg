vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF a08730142cf212c7b192ef85cdebd490a9ccc981
    SHA512 f6eff02e4a214c39757e95dad2ebff82e289f2b0fc1525b55c47bb759f62f9893af3298a5d1d5ce1281364a4ee3ee2c72e0fa6dad072b6f6a5f1a76efef54c3b
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/sdk/identity/azure-identity/"
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
