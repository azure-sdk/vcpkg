vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 5408d199eb3a5a282dbb4314ca63921ccdad47d8
    SHA512 19a29b81ca80293e0510821ccfb2bf0eee86a0f186fbf8a433dd18b92109b1c1ae42fac815a13a705d9671493a2ef56af85980b670dc154714c3603d5fece55a
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}/sdk/keyvault/azure-security-keyvault-common/
    PREFER_NINJA
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_install_cmake()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_fixup_cmake_targets()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
