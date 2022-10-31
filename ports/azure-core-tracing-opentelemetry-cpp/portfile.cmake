vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF bb95a22e3f5fdf7987c757ba241e67934b0dccdc
    SHA512 b33fa319bcddfc2887db783249ae950ebdcd5649ec4d958fa24423456c8d137d420bd434757da44359814f4e47bea2694fcb59e9e6e2f212947533197fb18344
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
