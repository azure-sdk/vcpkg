vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF c2e845266bc976079abc26143973740d9449ff1e
    SHA512 193cc983e02ccf98edc25a5f5afe9148f3a152b44c758de70e0beeea2fd41246045e637f15b345f2d973a8f16a749f65b9e2afc1306ad34aa19ed1d28c80ccb8
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/sdk/template/azure-template/"
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
