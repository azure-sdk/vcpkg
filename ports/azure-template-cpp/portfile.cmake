vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 8ee7d452ab4e8e8f4bec54238bfdd3aa40b541d1
    SHA512 25a290ef7b2c6b9e96c4c7eec7337778a56c618bde32776aea09d789b40f9a04b64631893cfc06c8dfdc8274d2f85b9bed6f536c1a309251f8d93d735d84866b
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/sdk/template/azure-template/"
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
