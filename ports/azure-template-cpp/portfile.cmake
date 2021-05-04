vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 84560cb5f77be170596b38e629096d589a3570f1
    SHA512 b5dca1a14dd09226bc817a7292a7c5edf3e72905a73bae7b64c5fca93c454e418799f20dd505b9707e8e4335e144081e07e4b5a637d49d76e2bae5228fe552a8
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/template/azure-template/
    PREFER_NINJA
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
