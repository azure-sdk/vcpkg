vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF ca9a40b6b73d0f84a57599e3a16c55b3b410bb05
    SHA512 e194d31a26331bb8fd239aec8cab8b05bb380ec190b622cc05e3bc2b4aae0e35c4e67b4e2bcdfd38fbb0fb3d9244a508b90029f28e18d4c763b2cbf421c83cc7
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
