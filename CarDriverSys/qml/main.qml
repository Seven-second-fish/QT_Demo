import QtQuick
import Skin 1.0
import Config 1.0
import QtQuick.Controls

Window {
    id:root
    width: 640
    height: 480
    visible: true
    title: qsTr("Car Driver")
    color: "#00000000" //设置窗口透明
    property int margin: 15
    Component.onCompleted: {
        Skin.currentTheme = 0
    }

    Rectangle
    {
        id:marinRect
        anchors.fill: parent
        //fullscreen
        anchors.margins: (root.visibility === Window.FullScreen) ? 0 : root.margin
        color: Skin.background
        radius: 5

        MouseArea
        {
            id:m_mouse
            anchors.fill: parent
            property int pressX
            property int pressY
        }
    }
}
