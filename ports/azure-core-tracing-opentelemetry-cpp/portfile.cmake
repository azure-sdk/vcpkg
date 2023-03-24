vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 2a39a3422b1ffaceea8ccf73dcc3e807ebf814b8
    SHA512 ada5a96fa4d24a39c5a5ce36489e7810c617063f27a390b6abbcbe56a575eb5597ed376da400ce2fe9f7c4822d11d82ca5f19ce905e66344273983bbc01b18ad
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/sdk/core/azure-core-tracing-opentelemetry/"
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
