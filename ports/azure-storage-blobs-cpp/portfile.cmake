vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF c457e91373406de2eb3f3f2cf2b16bad2b684ed0
    SHA512 e1ae7c76d717aae0c5312cb1447d8155ab20f35eddda1943eaf5730fccd0b9780dafc54b87980b01dcea96ab9889ab085ad1a68717a9f2251d0d88bb2221986a
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/sdk/storage/azure-storage-blobs/"
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
