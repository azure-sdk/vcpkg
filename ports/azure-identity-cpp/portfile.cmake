vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF bd98ee06ec610a6f42c93b8bd59e0c68d7969fb4
    SHA512 23593eddf1d5405529d74d1a7b3ad2d4e34545547ccd9034bbb8c30521de5eda1214b9c16e8aa8aa311191697a190c0b19dcb22ad93387e7078c38a25178918d
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
