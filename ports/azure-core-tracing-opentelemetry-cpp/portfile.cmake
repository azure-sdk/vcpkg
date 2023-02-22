vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 78eabdc1af9b55e686935770119f3df72d681b03
    SHA512 4ef8a33d2beca2073e20c5a89a2e202a9e8c48d40ac787b3d5f7d9d9a86fbf9ce6f3f9c50a7acaebef9bb23d9aef01b6674f375ef390249bf7338a5f87a8b294
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
