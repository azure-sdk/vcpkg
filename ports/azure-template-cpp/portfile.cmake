vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF fa0fa971551269323bc0eade9ca5ab01a29c1c4b
    SHA512 668ce9b8a8ed469278d2e0468933ef42c80931262d2adde3fd047c3e0917bfd4c5d3e8b0beb8727181a2546a2a9842f62891f6022a584f9d9a2ac3829fafe965
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
