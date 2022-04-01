vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF b61cd1b91d45011aaf87db52697806f1da7cb5ae
    SHA512 c43ec3c0621bf5feb8e779e448425bbebf13d8733ef8ae4c3701c2d57731d582856ab162a4a9ccdda1f28519cbd10fbca36fd6de956dab74eb4d09c1f2e23735
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
