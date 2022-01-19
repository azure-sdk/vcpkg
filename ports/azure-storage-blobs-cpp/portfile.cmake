vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 8474c4c69c560eb69742cf8575eae0777b12e5ab
    SHA512 57fc6d26a3cccd9dea8fc5cba3ff9afa091510c95ee45d82217af7a3bea6f06e1d4dd944efe89eba97fd012c4cb1e1ac253e8566a845264e2357996063b9d034
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
