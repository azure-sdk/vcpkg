vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF abf6be6951ed26c72d02b91b7df7e2a97b7aef1d
    SHA512 4094db63a3d19eb222bb6edc93438451b9a834cd523acc8fa2b67e0bcbd2d1e26af1decf06098438a27afab3296aa84901847e6df0a632af76e0b727025ed47e
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
