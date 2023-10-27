vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 71416d73b125942b0f2b55c4bf9ef07e3b9c1285
    SHA512 b9ca31809bd9f4d961d217e1a025a1b6dd7457b355bbeb589b39325110dcdf004bd269b12882c01ce1b192eb0a051fc43c268b0b050a6c098ccabc0f27cc3acb
)

if(EXISTS "${SOURCE_PATH}/sdk/storage/azure-storage-files-shares")
  file(REMOVE_RECURSE "${SOURCE_PATH}/sdk/storage/_")
  file(REMOVE_RECURSE "${SOURCE_PATH}/sdk/_")
  file(REMOVE_RECURSE "${SOURCE_PATH}/_")

  file(RENAME "${SOURCE_PATH}/sdk/storage/azure-storage-files-shares" "${SOURCE_PATH}/sdk/storage/_")
  file(RENAME "${SOURCE_PATH}/sdk/storage" "${SOURCE_PATH}/sdk/_")
  file(RENAME "${SOURCE_PATH}/sdk" "${SOURCE_PATH}/_")
endif()

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/_/_/_"
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
