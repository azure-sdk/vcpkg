vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 1b722bdb4d73e8262412dd6f84e2ab88ecb3eeb3
    SHA512 0e4c264f3f37d26d4ffd7afa22c16088a895b17169268f8e17e38bb106024b1fb017f03538e6b0be62d8065a053b151e0d8a68c024f3c6f11d681e05e0f0f4f9
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
