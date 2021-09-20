vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 0646d2ddfe75a5840d0f989d132ca2d3a5f4d102
    SHA512 eb2bab6955d45f4bc7e33a24c49d546fbfb2ef1fd4c869077d9cf65302281029d790c4dfa3e371d66415b985dfbdfe73059f5802b92ce5ec136a06f44f15db70
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/keyvault/azure-security-keyvault-secrets/
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
