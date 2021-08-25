vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 3ddd7f65f873825789fcfe3f12710874f0fe33e5
    SHA512 7ac65d89f92b65e78522368e8a6d3e3dbdd0872b3c86608b5f6f5698d01faea5ca31fd285609603c5b3bcab4358c5dbc34f15cd5fb9600189c080c86586e525b
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
