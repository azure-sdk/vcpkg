vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 818cab9a2a6fb086a5c19c0580a09080275e04bb
    SHA512 40a1cf2eba62b39182504c14c2f058be5c4ab1be727f0e3d4af005d4e0d803ab1fe03e5434aaa5d15ea2231650485a514ba8489fe62c7a83269dffcaeb67307f
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
