vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF f872841ffc9d6339fcd7303af20c6763b95d5b2f
    SHA512 0ecb8dda00e45e3385e12ec3904ecdff4266f85bad5b0e9bde2ca1c8d1ad098273e7fe8382680b85b5745e8a820082064047fe8142683ee4fb5a08ce5f4f0160
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/template/azure-template/
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
