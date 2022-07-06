vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 0456c58298417bf4f14d1f9b7aad6aa6ef6fe123
    SHA512 a915fefdbf91a411da6fd4584e5becdf295ac24c52be8f758a0983b6a00f60d151b6e77c506702657cf7a56aaeaf2a5100642023dcdb2628daf11de024abe4f7
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
