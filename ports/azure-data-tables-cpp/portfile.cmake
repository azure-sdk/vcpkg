# NOTE: All changes made to this file will get overwritten by the next port release.
# Please contribute your changes to https://github.com/Azure/azure-sdk-for-cpp.

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF aa728eed6d171cb58ed5c9a671b70a3cfbc4a349
    SHA512 be8080e24f8bd4cec8fbd11272d0b9a691f03b0dbfc546c40bb19d24e60373359e435c103e84be61db44bf690bc11acf9a95ec9928175dcf4978463f512f1f61
    HEAD_REF main
)

if(EXISTS "${SOURCE_PATH}/sdk/tables/azure-data-tables")
  file(REMOVE_RECURSE "${SOURCE_PATH}/sdk/tables/_")
  file(REMOVE_RECURSE "${SOURCE_PATH}/sdk/_")
  file(REMOVE_RECURSE "${SOURCE_PATH}/_")

  file(RENAME "${SOURCE_PATH}/sdk/tables/azure-data-tables" "${SOURCE_PATH}/sdk/tables/_")
  file(RENAME "${SOURCE_PATH}/sdk/tables" "${SOURCE_PATH}/sdk/_")
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
