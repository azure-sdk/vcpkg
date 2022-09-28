vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 53797c82ce411a6d1ee67ca83ab88fe9a9e5225c
    SHA512 7db4d4badf6759592d7fe460fca94868d1dcd12280bfbf4e43746227429284d468b6198b6d918a77dc53ecf294733493e87b8e54b3ea639a67a998918ff5d5ce
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
