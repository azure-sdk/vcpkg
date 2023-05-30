vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF b9d83aa5b8f2afb1bd38fccbbc1b3cdeda44de7b
    SHA512 f25fb76b18c39b11db7495979b267a9a7f5e5c7ac6f0cb9fb91af06fce6cb3a332623c6ac5348bac5022fce22d0e6c25ca1ad365648f150425808d35b5546874
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
