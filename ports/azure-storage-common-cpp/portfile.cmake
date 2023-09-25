vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 4b155b5a728819a4042303464f8d53ef69ce47f4
    SHA512 c728cf26de2b0050504fedcc097f92ee9bc93ccbe9395bee644077c6cafe5eb8dbf67d028ccec00172e7948b535c34e65adef46254ae820a0271ad017fc41394
)

if(EXISTS "${SOURCE_PATH}/sdk/storage/azure-storage-common")
  file(REMOVE_RECURSE "${SOURCE_PATH}/sdk/storage/_")
  file(REMOVE_RECURSE "${SOURCE_PATH}/sdk/_")
  file(REMOVE_RECURSE "${SOURCE_PATH}/_")

  file(RENAME "${SOURCE_PATH}/sdk/storage/azure-storage-common" "${SOURCE_PATH}/sdk/storage/_")
  file(RENAME "${SOURCE_PATH}/sdk/storage" "${SOURCE_PATH}/sdk/_")
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
