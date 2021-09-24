vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 9ffa5c06cd66884e1972853deaf728fb079e8cf3
    SHA512 8fc28379252f3efe1da8d81bd915faf4a6d6e6cdbe9dcfd87922388b233479dcf3a5859b704c76ec6bec0fc851aa4d43a754d8deece634fd6c833a29edef2666
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
