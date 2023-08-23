vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 97845b77eb600fb666b420ac64cf480e79bde7f8
    SHA512 ce0f6f91135ce8c1e096a67c735e6dc985abe4980d35a5e125259db0ae4014a46c3c24b83e680efdb8ba52663610977a76c44a9fb90aa92b4f6b4ed4b003fefa
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/sdk/template/azure-template/"
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
        -DBUILD_TESTING=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
