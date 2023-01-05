vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF b372b85f5b1f5b0e8c021d2b07ab198f9b1fe9cc
    SHA512 4f8d46af0c7d09cb2dfa70172d0c4086af7c994649ff2a5909f133ccadf5347c3e1962e2048474c1afd77dd26b394df923b0ff18f87472b5f6df44d98d9b6014
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
