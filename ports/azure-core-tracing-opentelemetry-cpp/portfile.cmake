vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF f3a21da12663b6508ca4a83c6b50d77967545290
    SHA512 aa00c37ba72ffd44e51d93dd8362f7785a7c2e27e1178082f0fb2a64f4ee65808effa4e566f8c737509165e29a5572a470a083ff6822bbe74dcbc9238094fff0
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
