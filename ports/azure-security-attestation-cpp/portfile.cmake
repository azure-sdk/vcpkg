vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 2c8143a702af04d6779622b2ea050ed77f7b530b
    SHA512 bba073e9c5d92d5f4111c6204b8d01a140361b9d8535e841d4d9fb2590c227da14c44b17af6751c7842e30ed28c1493e3b55b4953ad0e51a1788bb412000ed04
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
