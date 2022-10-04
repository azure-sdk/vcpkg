vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF cc64ffae58d226fa09c893506e99a44ef24a92ca
    SHA512 609adb666824be1fbff1dd13f39a975d9b8c19087d6a7b775144039e21f5d121b546ade76300c16aa8cd7e8a2c64af18fbe9d336a1e6cc9c0bdaa2d3de66d5b5
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/template/azure-template/
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
