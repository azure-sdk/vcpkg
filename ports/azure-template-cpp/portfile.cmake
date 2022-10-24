vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 66fd7dabb911e9767c3b3215a27b0491f4a6adba
    SHA512 474d94ad7cb0e5eb794b08bd37fd2366a91f4e0899406ca44ac369e51d959a6525d29a78d44e5b4259fe3b56be637c8b67cafb6d9a60a97422440b3861be884e
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
