cmake_minimum_required(VERSION 3.16)

project(CarDriverSys VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick Qml)

qt_standard_project_setup(REQUIRES 6.8)

set(PROJECT_SOURCES
        src/main.cpp
        headers/musicplayer.h
        src/musicplayer.cpp
)

qt_add_resources(RESOURCES qml.qrc)

qt_add_executable(CarDriver
    ${PROJECT_SOURCES}
    ${RESOURCES}
)


# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(CarDriver PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.CarDriver
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_include_directories(CarDriver PRIVATE headers)

target_link_libraries(CarDriver
    PRIVATE Qt6::Quick Qt6::Qml
)

include(GNUInstallDirs)
install(TARGETS CarDriver
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

#生成的build文件夹位置由编译器控制，可以调整kit
