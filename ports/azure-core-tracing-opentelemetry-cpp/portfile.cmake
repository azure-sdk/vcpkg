vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF d5e2ab88a97cf5e060a226d411ea4295f0e739d8
    SHA512 8f50a6fe62c40c2d623a4a4bd31ce84acfde29959bc5bf13d3964337ec3f37fb49bf228c667ad05f955b8b10f9bd4ede2646adedc2bac2b57ab6a271375c5672
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
