vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF ec250af51e3162c94acc124e9068c42749edc159
    SHA512 3e82d0bf6315d0a835f95790efab404b6415ffbc2b1bfc4fd7487c4e283ced6ea1a0126b37805c0a4decd8d706467e626e9ec0523cc4dc884b3bb384cc1cab53
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
