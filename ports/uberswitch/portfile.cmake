# header-only library

vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO falemagn/uberswitch
  REF 104cb49ac00212140c6304f84057b0502690957b
  SHA512 fcfee10d2eced184e45bcaab55a3bf0f4e888bf5c90f1e57aae6171f58ce039e0eff75cb2edde3d57118050efff5fae2aed0c19f91292f190ba0cc6f330f70d7
  HEAD_REF master
)

file(INSTALL ${SOURCE_PATH}/include/uberswitch/uberswitch.hpp DESTINATION ${CURRENT_PACKAGES_DIR}/include/uberswitch)
file(INSTALL ${SOURCE_PATH}/include/uberswitch/fameta/counter.hpp DESTINATION ${CURRENT_PACKAGES_DIR}/include/uberswitch/fameta)

file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)
file(INSTALL ${SOURCE_PATH}/README.md DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})
