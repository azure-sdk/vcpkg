vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF b9e09760e5dae2282e9ac28f5510090a828364de
    SHA512 8c4ef0c223564fd4f122c6d8db3def708b2612e31e49e34ef7d1685bcd2e57fff91571a99174644f9a68ee5e78bfed6fcc3eb5645b5face9a353f8618ed0e5cb
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
