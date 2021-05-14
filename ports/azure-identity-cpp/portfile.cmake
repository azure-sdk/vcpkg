vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF ea072fff4dc18664f0cf41a512131ad52520fe36
    SHA512 933d360ab9c82e438785a582a70a0676b97380815eb4b94bbb7ca2e4d05255afcb9e31570ab17fb24573a717d6266d3fb4935dc1009511b73838012b04381e7b
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/identity/azure-identity/
    PREFER_NINJA
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
