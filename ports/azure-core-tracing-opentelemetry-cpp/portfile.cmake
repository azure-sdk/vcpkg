vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF d114e4d58de48958b932bb9b48dc82474f0377e6
    SHA512 83cdc41430a79a7a172a8013bb0418395e2833e805ff4e992b36e1b5286567e12d057a6f0da74caf9538ecda2cad8120d2e3e2707eac4a3fffcda6d53772ce5d
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
