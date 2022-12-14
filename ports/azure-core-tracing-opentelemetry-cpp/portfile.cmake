vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF db6f71fbbb185c9dd0d4c9fc8199a71d647ecf09
    SHA512 fc20182c72e549ab0641a2f69aef1fea995b846a49f18d4f43ef1b5047ba9cdc95a1ffcb403f0d62ddfae6b15bda16f77b21be69266ef71a9b059693d0661c3e
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
