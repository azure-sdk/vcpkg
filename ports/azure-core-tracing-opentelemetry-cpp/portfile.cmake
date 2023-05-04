vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF e534c3ee4a2e17b27aef41c373b682156b7ea388
    SHA512 a67f4251cd168dfc2ac72f398bd20cd16f850062b7cdb65ffe9b8c8654c476e1b4aea16540c17c9f99d2a90c7f26e66f9dff3192fa4373713c869d0719a5c44c
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
