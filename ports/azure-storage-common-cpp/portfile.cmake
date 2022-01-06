vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 4f8f96eb88d62bfda12d1d5751cb1c60dce94f8e
    SHA512 d5ea61e16225531ec4edf558db98ed81c0d93ac1078c16d0b283caaa7cfcbc0b60646ac47f1c43d52a0080a2de0a44cacac2c4fac75df72760b384c1de15b69b
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/storage/azure-storage-common/
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
