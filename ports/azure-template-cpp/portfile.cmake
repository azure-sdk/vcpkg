vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 5954ef7354f718a7ecbad2d1bb1ba775f4f3913e
    SHA512 48c8b8f0f9a81ec9368f7bb0eec2a6d191188255270d202e0e94c581f3dcf6472eaad6cd5f71f72c1997e382abc5c15f85885327a1bebbcdcaadeff50c3ca9b4
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
