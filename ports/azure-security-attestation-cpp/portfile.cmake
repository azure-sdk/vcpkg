vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 1e013e5fe90d742b9b0ef2210e1cca1e638c18ec
    SHA512 c84cd17d0a1533a41321309a63ef21e30378aa3e233fbad4b6380829bcc1d0019fc3728d746b1fd6ab533f6cc31aacd4ce4cd9a9c9eca633f7a77222f457937c
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
