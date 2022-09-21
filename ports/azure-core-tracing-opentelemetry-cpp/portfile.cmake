vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 14e4f52b9179fa05c4e150f61b3a437f8ad76863
    SHA512 735ba467fa0d2f42049b32b60aff9c81edaca0bd0f928f5d7af3b9cd8475b06a4f499f8b494bb1e9cf64194c3ed88978e61e57a9144dd3d039b84af8e9f91671
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
