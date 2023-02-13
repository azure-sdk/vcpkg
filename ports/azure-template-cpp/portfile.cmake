vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 5e0159d8faf1600998f1973b6793f25b1c50144c
    SHA512 6dc6d5b6be4d1dd80f82a883735db9394441e3b6bec5ce7bddb83432a2f691065c3fb199206edd76475e97ef6326c3fde10c8845e1dec4a329fd4bd10f92f60b
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
