vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 1ae6ecd0a544c6f7419aeb1c9e07a639c342c216
    SHA512 d0b4797ef70ce5cfab305ba5e9f94bf5191ee8ab632b2a9e954d34faa876363a8e7cbbac4edc81224c76dffc59ff8340f428e8e8b5ff237efaf41edc6745ef95
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
