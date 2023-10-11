vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 436c0905e20ec2892b5ff85fe9ada988ae24ebd7
    SHA512 f09e9b1e62d542156633216c526d7737f0671a49072328544fdc41deb676fe83fec874908c9babaedf077e1220df536d71dcb4d1c26be73444114079577d10aa
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
