vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF ef2f8d92c9716a365e5bcec88c8ae3fe0170f63a
    SHA512 80d46720ff3fbd7ee6fd997846e9c8cfedb4f3a14334f55dc396fa7ee82eac4633dda137fabe38e3877dd5a0e905f5a0feaf9353e1b482c56398e1763d269ae7
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
