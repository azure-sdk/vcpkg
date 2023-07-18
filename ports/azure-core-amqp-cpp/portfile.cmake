vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 86612b57fa78e2961aa731c06a221553c8f9d564
    SHA512 c9853fcbf7a86533b25ef5f33c7ca2fddcab3e6ae2bee0c3725a39e347714b60d3e49c26efa0b169f7627a6b28b7f9f83f9d8e188ff72461c37f68bdbae9acf2
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/sdk/core/azure-core-amqp/"
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
        -DBUILD_TESTING=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
