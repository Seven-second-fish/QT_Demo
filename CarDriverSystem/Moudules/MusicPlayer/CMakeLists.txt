qt_add_library(MusicPlayerModule)

target_sources(MusicPlayerModule
    PRIVATE
        MusicPlayer.cpp
)

target_link_libraries(MusicPlayerModule
    PRIVATE Qt6::Qml Qt6::Core
)

qt_add_qml_module(MusicPlayerModule
    URI MusicPlayer
    QML_FILES MusicPlayer.qml
)

