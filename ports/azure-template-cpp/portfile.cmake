vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF af7281ef1a273404abb9c79f4de775b5b32f089b
    SHA512 cc5a4db9b1dcaa15bd248ab2aa1e6cc431e4848239899fda2d67ea25919320ad684e44cbc6e632cda468e6fa4386bf311efff86868ff1f45945c2cd147c1f04b
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
