vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 637def0979f0a56af7f76b8c3f03bbe7837938fe
    SHA512 6cfb87e8ba21c9c63c44c8a9a828d55a759a4b0befb922e41aec1c2b415c5768336a05589a84b65eb8ec5f08e3cb407cafda234cb1f37474a69a7bf19a1d3919
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
