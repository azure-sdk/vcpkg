vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF 716129f5c00cb2f1ee9acefa526ee6678674e466
    SHA512 e0db9153f2dc78616878b4a8a528a2b6abea007979a4c2aa7e96a52b7fe242454c84de5166929981f6496fe9f9ff3fea4864a6b9be70b9b6428db32c09fce777
)

if(EXISTS "${SOURCE_PATH}/sdk/eventhubs/azure-messaging-eventhubs-checkpointstore-blob")
  file(REMOVE_RECURSE "${SOURCE_PATH}/sdk/eventhubs/_")
  file(REMOVE_RECURSE "${SOURCE_PATH}/sdk/_")
  file(REMOVE_RECURSE "${SOURCE_PATH}/_")

  file(RENAME "${SOURCE_PATH}/sdk/eventhubs/azure-messaging-eventhubs-checkpointstore-blob" "${SOURCE_PATH}/sdk/eventhubs/_")
  file(RENAME "${SOURCE_PATH}/sdk/eventhubs" "${SOURCE_PATH}/sdk/_")
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
