vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 779c268a7f218c0a5a341f9ba4d402d3cfc3cac8
    SHA512 3c00c49559f8a8d7d0a607ce5845d5b2baf8fb04301ea3b04f000c4ec584300bce506663824c2a29165411f85a52341d5d9e35f3cdb4fe6c2189eabeda45ead1
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
