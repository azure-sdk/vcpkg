vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF f0a379bf21ccaefbee37be5c2a584e628f5ee443
    SHA512 c26dceb65830738545122ce73d5abd7b1bf110b299f9f2f784a72d868f21ad0e1b5fa98bb36aee32b0e8f1598ca0b1f1a30426429bf4987a951dfb8ad5bf2400
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
