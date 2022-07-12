vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 6d3ecf10829ccc72342038dadf0fe0cbda42cf51
    SHA512 38d24dae928ba8021622fc56fd77b07f5206eb463304ebc282d0183836ac6132cbcdf3b2b7c25b0aed43f8402ba629fa399024ae4ab6fe7be787df8831b34e8c
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
