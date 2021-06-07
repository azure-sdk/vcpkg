vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 17b91ffe598cf17bb4755480b70a9bb6fb3a02f3
    SHA512 63eaf25c70aee9c290890363116ae74366b38bb3574ca1d3bc9e93ec1a1113d3c89c6df8e8b3ae5e603ee19fcdee3d0e2317a11a5bfdd1fef100e3bb77924a2a
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/keyvault/azure-security-keyvault-keys/
    PREFER_NINJA
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
