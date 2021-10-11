vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 4eb33a00152d0bd3f95a4826933478151ddaed8f
    SHA512 54fa05c6cf7dbef304ffa06ed7d30f91886967c74443fe089bcebd87b9306709cc16e135effcf5eadeb4c6115e71fab850d9bc5960c77feccd0a7f05ab61dfe4
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
