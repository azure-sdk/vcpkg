vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF b5c456c712afabf5b6af19854dc0aa1968324d73
    SHA512 2a177e9d9bb24894181833c5f5dc80b8e58fa5e82c2b96e7561f5cd3b5aec2be36692ecb9fde2aa6dfbbbc123ab1b613d74f10288c155135f01ad65b84c36a54
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
