vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 490250646f570a49d0ba85e03d4e184c64925017
    SHA512 414ff1cb9967e8e06cac3d93bb373fc498b7e3a0a0e35bb17034136fd9267c0f6e21c0edde069a1f961e1dd123825615d9ada4e90bbe37906a3c0dc059b742fb
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
