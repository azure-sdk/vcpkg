vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF b7e7e4e0008c0d8146f762531dcfeea55da990dd
    SHA512 2b0fe031ffcc07f5858c35de6661a97f6d1f7314a63f4195373a43ae4283ddb84f6943fb6822ef61b5486f9ede3087a5960da846d4ec77793407f9bcb2d69d7b
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
