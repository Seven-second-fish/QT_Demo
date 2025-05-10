import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Effects

Rectangle {
    id: toolbar
    height: 50
    color: "#e0e0e0"
    radius: 5
    layer.enabled: true
    layer.effect: MultiEffect {
        shadowEnabled: true
        shadowColor: "#40000000"
        shadowBlur: 4
        shadowHorizontalOffset: 2
        shadowVerticalOffset: 2
    }

    // 信号定义
    signal newFile()
    signal openFile()
    signal saveFile()
    signal saveAsFile()
    signal toggleTheme()
    signal find()
    signal replace()

    RowLayout {
        anchors.fill: parent
        anchors.leftMargin: 10
        spacing: 10

        Button {
            text: "新建"
            onClicked: toolbar.newFile()
            background: Rectangle {
                color: parent.pressed ? "#d0d0d0" : "#f0f0f0"
                radius: 3
            }
        }
        Button {
            text: "打开"
            onClicked: toolbar.openFile()
            background: Rectangle {
                color: parent.pressed ? "#d0d0d0" : "#f0f0f0"
                radius: 3
            }
        }
        Button {
            text: "保存"
            onClicked: toolbar.saveFile()
            background: Rectangle {
                color: parent.pressed ? "#d0d0d0" : "#f0f0f0"
                radius: 3
            }
        }
        Button {
            text: "另存为"
            onClicked: toolbar.saveAsFile()
            background: Rectangle {
                color: parent.pressed ? "#d0d0d0" : "#f0f0f0"
                radius: 3
            }
        }
        Button {
            text: "查找"
            onClicked: toolbar.find()
            background: Rectangle {
                color: parent.pressed ? "#d0d0d0" : "#f0f0f0"
                radius: 3
            }
        }
        Button {
            text: "替换"
            onClicked: toolbar.replace()
            background: Rectangle {
                color: parent.pressed ? "#d0d0d0" : "#f0f0f0"
                radius: 3
            }
        }
        Button {
            text: "切换主题"
            onClicked: toolbar.toggleTheme()
            background: Rectangle {
                color: parent.pressed ? "#d0d0d0" : "#f0f0f0"
                radius: 3
            }
        }
    }
} 