qt_add_library(SystemUIModule)

target_sources(SystemUIModule
    PRIVATE
        SystemInfo.cpp
)

target_link_libraries(SystemUIModule
    PRIVATE Qt6::Qml Qt6::Core
)

qt_add_qml_module(SystemUIModule
    URI SystemUI
    QML_FILES SystemUI.qml
)

