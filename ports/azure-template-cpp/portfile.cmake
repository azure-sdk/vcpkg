vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 7301f348b0f8764047da7e0432e01bdd4910c7b2
    SHA512 ace820827ee86217dd4835261dedae6f3589386f9a2f1a96e77c3fd8d3511d79fc77a6ac5d83a8f9e805a922ad1e6fb4fa3ff332af402158b25fddb2e456db09
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
