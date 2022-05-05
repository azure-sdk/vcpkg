vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF b9fb5efb6ace3a755ec26c377188fa10344d1af8
    SHA512 ca5c517d16867988c99863b03b8eabb1d84f06fb9bc32cf1e42ee24606164ca605ec4119cd3515dd93a054f8b26ccdd6b76b934bb69b31f7a414540b209305d7
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
