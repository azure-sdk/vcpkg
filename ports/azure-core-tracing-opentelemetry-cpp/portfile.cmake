vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF e7bf602739331f12c9692b181a4a437de5dfe5f1
    SHA512 d378d5a7f92e4ffa34dffbcd94852e2a8cce1ab143a57812726581e55b68ea04078c9bb60c006f5fdfb85fbbd1c31edf796bcfce09830ab4fe04e9003a0d7ff8
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
