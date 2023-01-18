vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 6e6ca66c26c1a8a8e76e92e333af4b23fc84580e
    SHA512 4d9064fcc0b980fef35278de94a3138cc443c0c5f70e07b9bcc8490327579911f342a4a03291c8080fa5d73303ede2eb20c82b9fa9094b83a198da07d509bf8d
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
