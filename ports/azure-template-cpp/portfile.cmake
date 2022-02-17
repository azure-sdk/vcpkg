vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 473b7c301dff388c3d41e707a93efdb439b99f6f
    SHA512 4820ce4af6d6b4ff8d2d6cd5129f11ff99bb494ce340f9c30c5959712813fd103961a71b09369b49f5bd45a17e612b2196f87e7c92ffd7d1e1459650668804d9
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
