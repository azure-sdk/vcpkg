vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF a6de66df02eea8fd56709b75b7a7260f74110b32
    SHA512 aa5b37b86649ce4a6aba79214f076f510269800521592c631ae89a18b6c780f13e8f94f5691b2dfd197188126475ebe88a1af07c400c411e2150a4ff2598a443
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
