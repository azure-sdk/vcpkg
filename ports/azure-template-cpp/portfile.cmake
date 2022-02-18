vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 3060f0a777f5010b263a39b2d52c969a9ae3da97
    SHA512 e3edcc390b5cb8cb5ede5f8a5d40fa9e6fcfc56b2c0eef1fe38dc533c7e947075514b3c40533c5a7ec7fa6cc14e0e04837ccca6786bde5c8419649302ac071fb
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
