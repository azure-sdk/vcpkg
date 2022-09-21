vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 92957377fc2b3fc7bb506b78a4ad0b38f24a68cb
    SHA512 b1d30785ac2f9261f2e3c8ab542eae772b333ffa2a72ba25e31ace1a9237ac3797a2346bc1c5c3090111e8c166abb0b01fb92a88f0864529d54ec6b409d20d3a
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
