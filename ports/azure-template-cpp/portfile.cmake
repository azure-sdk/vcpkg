vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 85e358a2ba118cf09bb3957358e5b594c31317ba
    SHA512 b40d22870fbb6c736055fdcfea4e203cec2a00c02b2f4d8c8b61f1e0bf17b103342480dffa2bdb58d94c4e45f49b0d9fea2314bf96979602e2f343ce48f4f2f0
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
