vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 72cdbaa0fed2ba847607a0a5f372d70f83c41f2d
    SHA512 a9e79722e521f04346f5ab9063b1e1466a4229c7c81f407da5c9764e19d98cd1884d993b18718da3397ced41f39cceebaaa91b71f25dc17e194a9b5c0ffe7d6d
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/sdk/core/azure-core-amqp/"
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
