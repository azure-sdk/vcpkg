vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF d3dbd56d1dc50cd462641c31648c9d147f51e3e3
    SHA512 aaa25cc3700e4769ece9cd86ee40767bc36f81e4b342376b5fd8c6ae77eb303a7acd5e708cdc0f45ea3434577a0ff6c0ad55dc659696f6d2d8c61555fbeaa464
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/storage/azure-storage-files-datalake/
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
