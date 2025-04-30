cmake_minimum_required(VERSION 3.16)

project(CarDriverSystem VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Qml Quick)

qt_standard_project_setup(REQUIRES 6.8)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

# 添加子模块
# add_subdirectory(Modules/System)
# add_subdirectory(Modules/MusicPlayer)
# add_subdirectory(Modules/Settings)

message(STATUS "Adding subdirectory for System: ${CMAKE_SOURCE_DIR}/Modules/System")
add_subdirectory(Modules/System)
message(STATUS "Adding subdirectory for MusicPlayer: ${CMAKE_SOURCE_DIR}/Modules/MusicPlayer")
add_subdirectory(Modules/MusicPlayer)
message(STATUS "Adding subdirectory for Settings: ${CMAKE_SOURCE_DIR}/Modules/Settings")
add_subdirectory(Modules/Settings)


qt_add_executable(appCarDriverSystem
    main.cpp
)

qt_add_qml_module(appCarDriverSystem
    URI CarDriverSystem
    VERSION 1.0
    QML_FILES
        Main.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appCarDriverSystem PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appCarDriverSystem
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appCarDriverSystem
    PRIVATE
        Qt6::Core
        Qt6::Gui
        Qt6::Qml
        Qt6::Quick
        SystemUIModule
        MusicPlayerModule
        SettingsModule
)

include(GNUInstallDirs)
install(TARGETS appCarDriverSystem
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
