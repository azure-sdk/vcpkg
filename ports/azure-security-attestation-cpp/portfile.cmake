vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF f8ced21a1a107cfa56fd8fae9a1ba202565eb792
    SHA512 1379dbcf7a379caa3c6e03c0d4dca1b45538941fdb95c2ca6bfb15512eb14cd9cb6fc92f6285cbfdd33aa54780bbe59a939062e09ecf05003d20adb57e1e03ed
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/attestation/azure-security-attestation/
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
