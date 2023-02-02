vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 03965298bea1cf6ecda68efcfc4c4f5041bf3e01
    SHA512 dbd28fd69fb71d3c84f9177fed5e91975d74f9729f436fe9da6a3c505a785cdaa740764a0a55432fd25618bf2c6124ef456f3ae4c8d75b9b0760df3f5af3314c
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
