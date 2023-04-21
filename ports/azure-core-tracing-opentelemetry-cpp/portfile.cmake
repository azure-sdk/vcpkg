vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 26e3b35c176cc191bf22db929f9d4711927cfcf0
    SHA512 63e66477c859205cf2109dbc60e8dd26a554b5757d355251aa174ea9510dbc8f9f3788fefb8f50c47887f6da1f8bb7dc6d907342c191767da28668a7f74caa84
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
