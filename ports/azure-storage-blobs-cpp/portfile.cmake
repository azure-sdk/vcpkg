vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF fbe38f7fb35deb6636328341badf6d694ef544f4
    SHA512 73c1540ff369bcd9e8e4995ac2c4a3d9fb3af4ef2cd8f606bfe63652fa480bfd79019740d8aa3a8f3905f5ffaba80980fa6df27555aa5728c8e97a137fd045a3
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/storage/azure-storage-blobs/
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
