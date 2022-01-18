vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 34e5d9277b633d9a97e0729789cfae4e3fec246d
    SHA512 a5ce3a445bcda9ca620174f49a4808416b6d849eb064591daa9be2f1337ffacd87c2197ac62956fd70d5e40b13b7e4ec4d4c2ffbfed89c36855d34cc4272f9b2
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/storage/azure-storage-blobs/
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
