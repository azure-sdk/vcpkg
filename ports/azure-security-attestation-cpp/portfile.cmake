vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 82de63902d239429d4efb179b7e4cad1b7ed0e22
    SHA512 671959f845096b227a2883e1ce0187f897dc486d1f1d75d7ac8e1a275798328183f4adffe07b63fb978b131e5842d750add407a6b30bfca335cbda0a9cdacaaa
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
