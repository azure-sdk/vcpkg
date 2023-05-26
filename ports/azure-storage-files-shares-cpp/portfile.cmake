vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 99b1ef550042defd69e302eda8518c06d49e402f
    SHA512 50110304756ff63b9b40ca6aa1a81712b5b8f6d1333b7743d0a46d725ab8aeb4b3f7867130c6a854c5c3e21772b62738f9a416eec0c941891e51de0abc919280
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/sdk/storage/azure-storage-files-shares/"
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
