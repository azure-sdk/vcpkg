vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 613972c4c43e890d5a10ebf8535cde7570e2c7c2
    SHA512 85a7a9ebe341daad679d62967e7e655bf4de6f5568b3492b73b1ac84e671e4f685391d6f52b6bb21445db7da08fbdcd8c1585a6073de2f6c29bee030cad4ce76
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
