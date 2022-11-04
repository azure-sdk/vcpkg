vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 48e6fcf115829ad17a3b669d6f7bc8753c6185e9
    SHA512 a334d8bede413c3557e52c3a597ab56f089c8da1d5d6f0c01a39dbbc96f9b8a42ef1862320d4a68f40f49b7cfd9ed5000e19e6ceca1eebac8c88fcbd6f6cb3fc
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
