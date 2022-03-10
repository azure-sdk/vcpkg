vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 53f167dc375b57bcca850cf65377ba6b863cc524
    SHA512 21c486cdd3fb2406c18601b5e91aa878656172b16f7478899fe5ef78245c22e053b08cc8bd4d0f0ab47e8a0cf136b0b434ff86bb4ce9f84cc1dd3f9a531f9a68
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
