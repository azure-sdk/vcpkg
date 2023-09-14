vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 13f1759accdd3d0b0130e2d31b3011afb130ba48
    SHA512 719b5d3c6a4f2435d81ba247ae1c02332030b1d9b5efec1802ea2c206c69cef6281388677907bb8c72616601bab753a2209bf1140d37bd2733ec60fe5ae72471
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/sdk/core/azure-core-tracing-opentelemetry/"
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
        -DBUILD_TESTING=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
