vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF ffbafa165ee51eec0f9013de9aabedf072efa1c6
    SHA512 d1677fe699f4b266966eea6b6f6291ea5b8e4a6d6ed2047363929bcf70896130b329188af2409cc4ba141faacec8b8ce5dfd4bad7b10ea553d8258e12ede1494
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
