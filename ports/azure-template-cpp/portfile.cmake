vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 5174503dc302d5ebd92855b14b5abad498f8187b
    SHA512 bbcdd34647cdfc863dfd66a7d43d4dbff9b43f3b3d65704acd74ab90325f5876d16c2dd85f3956d11ff1e1b35ece2a62d0e5f2ab4ff3b90e62371485e336c95b
)

if(EXISTS "${SOURCE_PATH}/sdk/template/azure-template")
  file(REMOVE_RECURSE "${SOURCE_PATH}/sdk/template/_")
  file(REMOVE_RECURSE "${SOURCE_PATH}/sdk/_")
  file(REMOVE_RECURSE "${SOURCE_PATH}/_")

  file(RENAME "${SOURCE_PATH}/sdk/template/azure-template" "${SOURCE_PATH}/sdk/template/_")
  file(RENAME "${SOURCE_PATH}/sdk/template" "${SOURCE_PATH}/sdk/_")
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
