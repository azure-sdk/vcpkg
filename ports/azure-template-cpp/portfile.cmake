vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 65d560dc11239d166e2b89f6c8ddb2bec8356365
    SHA512 ac52c3697e7e87e0d1360a7e33c0088de55eca65f5fa5809a3ea7678ae32ecee69f2180c3d1a358e8c859c0d048c65cd8e433f84137ad968bb0b88e92505b2fb
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
