vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF d66081c01f2a856ff6fbccf1dc3e78e3de30d5be
    SHA512 1a8c6e08808ffef8cb9755575d486dc38868bbca7b4be23ace08ba10dddd0c2a8806287fe51be7604b42d663eb8eeeb00b925ed25b2daa9b1c404697cab3db16
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
