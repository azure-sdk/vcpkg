# NOTE: All changes made to this file will get overwritten by the next port release.
# Please contribute your changes to https://github.com/Azure/azure-sdk-for-cpp.

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF f8130a26ae5c5cd9604cdab70c2d9558142f9ffb
    SHA512 147d7ea7314f22f249ed5991e5504287fc8b8582319b50528ccb2c4e9d223ada5d583cdb00350300c66d6ab02afc06a87e8f5865e59d19b6dd5017ef7974c4f4
    HEAD_REF main
)

if(EXISTS "${SOURCE_PATH}/sdk/attestation/azure-security-attestation")
  file(REMOVE_RECURSE "${SOURCE_PATH}/sdk/attestation/_")
  file(REMOVE_RECURSE "${SOURCE_PATH}/sdk/_")
  file(REMOVE_RECURSE "${SOURCE_PATH}/_")

  file(RENAME "${SOURCE_PATH}/sdk/attestation/azure-security-attestation" "${SOURCE_PATH}/sdk/attestation/_")
  file(RENAME "${SOURCE_PATH}/sdk/attestation" "${SOURCE_PATH}/sdk/_")
  file(RENAME "${SOURCE_PATH}/sdk" "${SOURCE_PATH}/_")
endif()

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/_/_/_"
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
        -DBUILD_TESTING=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
