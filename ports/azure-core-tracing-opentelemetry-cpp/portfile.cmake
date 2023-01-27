vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF a3e9ad1d2c2509608ba6aaf78d0a400587e9b4fe
    SHA512 3e647ce9a8468d3563dcebdf79275bee528e91942a3d781cc92bc66e37e140487b27ac76f7ad8efbd4ffb85c4f1bbcab5c838c8c5165d889477a5c4f5472542b
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/core/azure-core-tracing-opentelemetry/
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
