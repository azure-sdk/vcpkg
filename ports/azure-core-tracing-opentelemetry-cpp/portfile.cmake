vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF fd687c32fa18bd8f1daacadd8c8aff870eb08e26
    SHA512 5e70a79425a42c6b63cc24b3483aba7bf8ebe67cc2a26c56eb99d1dbf51fb9d77c718328a1ebe1241f3ee81e5fefdcd60b29f37076f52f483788095d4b2b5cd0
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
