vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 801452f6b96384fcda94e1fe250bb11804e24eb3
    SHA512 693835955cb774e2a6f311a4d4d10d7d8c7a8b66540ab3af95559ecf0cccd61b75305b498ba6da7e0d1a75f8dc6ce2f47e5ace0cfa8b22294bd3b6394b4b2cfb
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/core/azure-core-tracing-opentelemetry/
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
