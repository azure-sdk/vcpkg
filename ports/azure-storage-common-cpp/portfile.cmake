vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 5edde94abd87502c6f69e9a470574694c4a43d52
    SHA512 f337e42e90c0f0b54e2aafa58e1de3fb4bde75e357f6e9776305ad9b99f99671d54c35a8a99ac2d97c5f9d9ee897733b6c9c2461087455ecf19d8d9b2761a292
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/storage/azure-storage-common/
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
