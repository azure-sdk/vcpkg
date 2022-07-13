vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 12f52838c74a9fcb26f128f73144817ae0c3cd0b
    SHA512 acf87ccd2f6f0967fc04e7e2bcf6dacc8a8be3aadb4b867aa913709f50c79b38c7f0d7cede6c05b047a651f4a2dcc775eaf0a817662b9d1ef7211597eff7b7dd
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
