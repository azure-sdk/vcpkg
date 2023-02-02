vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 72f8721e26583d16f323cd7790f98de4657049fb
    SHA512 f2e1051e2e12ba0cf92f08dd2f99e1d190a414de9dbca5399f02ebc58671dbb3a117e6586058db4fe42bb9b058372a69a0b0031e07f9d53b23f668a17aff6f03
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
