vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 17ca68720c271b614ab8791974c1ab78b8dba48a
    SHA512 8f089879e783829603c4ccfb42161f6669bebf80f26fe939ce1aa869038d8584c473c6102abd20afd4749d26aa11ade2f66d8b611e7444bed421cfcedb1acd99
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
