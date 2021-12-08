vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF f758b5917a55bfca412fcf99c748b01d55b79bc8
    SHA512 874383cca641cc5ab7f39787643617fb00ae0f5b9b733bcbe2938a539dd6d434a207e41b47db8150542b19713f997b9b4f6aac37202322599622553c93211ad2
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/identity/azure-identity/
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
