cmake_minimum_required(VERSION 3.16)

project(sonegx-video-editor VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick QuickControls2)
qt_standard_project_setup()
qt_add_resources(QML_FILES_RC QML_FILES_RC.qrc
)
qt_add_executable(appsonegx-video-editor
    src/main.cpp
    ${QML_FILES_RC}
)

qt_add_qml_module(appsonegx-video-editor
    URI sonegx-video-editor
    VERSION 1.0
    RESOURCES QML_FILES_RC.qrc
    QML_FILES src/qml/Views/ItemProperties.qml
    QML_FILES src/qml/Main.qml
    QML_FILES src/qml/Views/InteractionElements.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appsonegx-video-editor PROPERTIES
    #    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appsonegx-video-editor
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appsonegx-video-editor
    PRIVATE Qt6::Quick Qt6::QuickControls2
)

include(GNUInstallDirs)
install(TARGETS appsonegx-video-editor
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
