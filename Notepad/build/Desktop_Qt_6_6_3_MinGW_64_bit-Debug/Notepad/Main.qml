import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Effects

Window {
    id: root
    width: 900
    height: 700
    visible: true
    title: qsTr("轻量级记事本")
    color: "transparent"

    // 主题切换
    property bool isDarkTheme: false
    property color backgroundColor: isDarkTheme ? "#2d2d2d" : "#f5f5f5"
    property color textColor: isDarkTheme ? "#ffffff" : "#000000"

    // 主窗口背景
    Rectangle {
        anchors.fill: parent
        color: backgroundColor
        radius: 10
        layer.enabled: true
        layer.effect: MultiEffect {
            shadowEnabled: true
            shadowColor: "#80000000"
            shadowBlur: 8
            shadowHorizontalOffset: 3
            shadowVerticalOffset: 3
        }
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 0

        // 顶部工具栏
        Toolbar {
            id: toolbar
            Layout.fillWidth: true
            onNewFile: notepadPage.newFile()
            onOpenFile: notepadPage.openFile()
            onSaveFile: notepadPage.saveFile()
            onSaveAsFile: notepadPage.saveAsFile()
            onToggleTheme: root.isDarkTheme = !root.isDarkTheme
            onFind: notepadPage.find()
            onReplace: notepadPage.replace()
        }

        // 记事本页面
        NotepadPage {
            id: notepadPage
            Layout.fillWidth: true
            Layout.fillHeight: true
            backgroundColor: root.backgroundColor
            textColor: root.textColor
        }
    }
}
