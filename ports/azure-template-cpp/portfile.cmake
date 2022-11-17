vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF a9efb5ad5666a841f658a1c54c67a9a95ffd499d
    SHA512 7dd46545f2ab9e3655e4e60c936b7e97954e43155f662880d7988edbf261dd59f40b283362d5b2702fb6765867b8def6bd0f0f8f2f360d00c09f43509bbd4efb
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
