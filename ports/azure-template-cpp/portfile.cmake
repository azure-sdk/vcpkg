vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 0bde2ad3f8daeecd1c63e0800a0c7fbbc1a0857b
    SHA512 1081bbc82636b52db0a9005dee2c782845a765bf7a1cfa007d298517f54cb9a92a52cd6459e582f664efb79755e7c79231bf7b6bae5fe15a0b6e8c2c8181982c
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
