vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO QiuYilin/taskgraph
    REF "v${VERSION}"
    SHA512 5580dcd6a1a00a84124fca5bff9327cdf4a9c42008822ebbd48f8c748f0fd73e686dfd9bf4cf43e105bdef4e97d915f17a8002d655f86fcb52a11bfa707ee500
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
