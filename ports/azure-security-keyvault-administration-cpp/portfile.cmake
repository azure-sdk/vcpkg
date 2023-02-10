vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF fd1695ebbafe862be06a9c9f88afa87a61878c5b
    SHA512 a5d85ee4c888f1a8f8c0ed505ca1dea96ab8a3364f34dab9cfb79d670ea486d3fff79ffbbae1385ef2d42f9b5faf325d36a26cac7bbc34e2688a263aec7230e5
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/keyvault/azure-security-keyvault-administration/
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
