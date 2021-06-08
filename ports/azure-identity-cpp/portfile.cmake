vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 8f08d9c0430baa6ff56803f9dac53689142d2ef4
    SHA512 8f2411440fa9ae4c8f8ef498dbbfc2b35d34c901d5e576e9a02bfb4fdb57f597d33bab10f6c1c1bee8a00e48773fcbac6ffb9f8d9968aa2e3131672c7491024c
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/identity/azure-identity/
    PREFER_NINJA
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
