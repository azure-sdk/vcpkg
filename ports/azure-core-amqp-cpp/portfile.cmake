vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF ec220be784d873e02a67d2e3c355791ba1170bd7
    SHA512 3e985b125185a93d90be70e73514976a100f5de6a81928bf3a11b888f1336a787cf6aace992d8f0887ebdcc4b0249aa66bfb1164af68a8541081f6cb73090c1a
)

if(EXISTS "${SOURCE_PATH}/sdk/core/azure-core-amqp")
  file(REMOVE_RECURSE "${SOURCE_PATH}/sdk/core/_")
  file(REMOVE_RECURSE "${SOURCE_PATH}/sdk/_")
  file(REMOVE_RECURSE "${SOURCE_PATH}/_")

  file(RENAME "${SOURCE_PATH}/sdk/core/azure-core-amqp" "${SOURCE_PATH}/sdk/core/_")
  file(RENAME "${SOURCE_PATH}/sdk/core" "${SOURCE_PATH}/sdk/_")
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
