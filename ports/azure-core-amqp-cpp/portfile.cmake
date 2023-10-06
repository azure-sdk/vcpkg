vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 9e4a24bf90b06fa75a2e6c6bc95cceb498c28cba
    SHA512 ee652a3a21e0d4744c01ddc5a67d81461e796d7af97b0ce577688fea4eca42af714de77f778084977b7b82e28bfdbf3473b7020f74cf57569aeb2d766ab6150b
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
