vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 0c24db5a10eeea46840c3e8ee7089fd9857cd7b4
    SHA512 0d183b4d6913cf05324befd6022063e90f715a35f081b68809f4710c827db30f87459ee794c478e30ab0916de2635d1e329120c73491c4059ef0c16e0684e2fe
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/storage/azure-storage-files-datalake/
    PREFER_NINJA
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
