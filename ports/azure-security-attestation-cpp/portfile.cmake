vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 64e3130e2c2816453b5d948b9488bd2d4b6efb87
    SHA512 654ec9868a13e1fda7da5201ba48ae0315c0c00fe5d7425fb2de04d085cf3ce831a56b521edd2879b7235d337c9e18b974c2c81a7e6469e243c67ed3bcd4d444
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/attestation/azure-security-attestation/
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
