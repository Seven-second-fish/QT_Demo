qt_add_library(SettingsModule)

target_sources(SettingsModule
    PRIVATE
        SettingsModel.cpp
)

target_link_libraries(SettingsModule
    PRIVATE Qt6::Qml Qt6::Core
)

qt_add_qml_module(SettingsModule
    URI Settings
    QML_FILES Settings.qml
)

