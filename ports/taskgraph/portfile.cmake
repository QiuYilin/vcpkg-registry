vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO QiuYilin/taskgraph
    REF "v${VERSION}"
    SHA512 62e2848637f0272422a35da588b0b9c5e11898d5c3168dd788676920a4c2fefdb23df7616c95aacf4274734c22044c945e66d1708fbd1f05342671936975340c
    HEAD_REF main
)

if("ui-imgui" IN_LIST FEATURES AND "ui-qt" IN_LIST FEATURES)
    message(FATAL_ERROR "taskgraph: features 'ui-imgui' and 'ui-qt' are mutually exclusive; enable only one.")
endif()

if("ui-qt" IN_LIST FEATURES)
    set(_taskgraph_ui qt)
elseif("ui-imgui" IN_LIST FEATURES)
    set(_taskgraph_ui imgui)
else()
    set(_taskgraph_ui none)
endif()

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DBUILD_TESTING=OFF
        -DBUILD_EXAMPLES=OFF
        -DTASKGRAPH_UI=${_taskgraph_ui}
)

vcpkg_cmake_install()
vcpkg_copy_pdbs()
vcpkg_cmake_config_fixup(CONFIG_PATH share/taskgraph)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
