vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF dc4309a65a26ee65ee7b2d5734975067d95866ef
    SHA512 c0544d885738825e02288969711006fd9c3bcee16d9199c4b2c92c4bc0ce9d9c827ae7c8712ef8c689017b5474205b5d8e61bd9dae04a8bdbc39985728bb47e0
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
