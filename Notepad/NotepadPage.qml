import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Dialogs
import QtQuick.Effects

Rectangle {
    id: notepadPage
    color: backgroundColor
    radius: 5
    layer.enabled: true
    layer.effect: MultiEffect {
        shadowEnabled: true
        shadowColor: "#40000000"
        shadowBlur: 4
        shadowHorizontalOffset: 2
        shadowVerticalOffset: 2
    }

    // 属性定义
    property color backgroundColor
    property color textColor
    property string currentFilePath: ""

    // 文件对话框
    FileDialog {
        id: openFileDialog
        title: "打开文件"
        nameFilters: ["文本文件 (*.txt)", "所有文件 (*.*)"]
        onAccepted: {
            currentFilePath = openFileDialog.selectedFile
            var file = Qt.openFile(currentFilePath, "r")
            if (file) {
                textArea.text = file.readAll()
                file.close()
            }
        }
    }

    FileDialog {
        id: saveFileDialog
        title: "保存文件"
        nameFilters: ["文本文件 (*.txt)", "所有文件 (*.*)"]
        onAccepted: {
            currentFilePath = saveFileDialog.selectedFile
            var file = Qt.openFile(currentFilePath, "w")
            if (file) {
                file.write(textArea.text)
                file.close()
            }
        }
    }

    // 查找对话框
    Dialog {
        id: findDialog
        title: "查找"
        width: 300
        height: 150
        standardButtons: Dialog.Ok | Dialog.Cancel

        TextField {
            id: findTextField
            anchors.fill: parent
            placeholderText: "输入查找内容"
        }

        onAccepted: {
            var text = findTextField.text
            if (text.length > 0) {
                var index = textArea.text.indexOf(text)
                if (index >= 0) {
                    textArea.cursorPosition = index
                    textArea.select(index, index + text.length)
                }
            }
        }
    }

    // 替换对话框
    Dialog {
        id: replaceDialog
        title: "替换"
        width: 300
        height: 200
        standardButtons: Dialog.Ok | Dialog.Cancel

        ColumnLayout {
            anchors.fill: parent
            spacing: 10

            TextField {
                id: findReplaceTextField
                placeholderText: "查找内容"
                Layout.fillWidth: true
            }

            TextField {
                id: replaceTextField
                placeholderText: "替换为"
                Layout.fillWidth: true
            }
        }

        onAccepted: {
            var findText = findReplaceTextField.text
            var replaceText = replaceTextField.text
            if (findText.length > 0) {
                textArea.text = textArea.text.replace(findText, replaceText)
            }
        }
    }

    // 文本编辑区
    TextArea {
        id: textArea
        anchors.fill: parent
        anchors.bottomMargin: 30
        background: Rectangle {
            color: backgroundColor
            radius: 5
        }
        color: textColor
        wrapMode: TextEdit.WordWrap
        font.pixelSize: 14
    }

    // 状态栏
    Rectangle {
        id: statusBar
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        height: 30
        color: "#d0d0d0"
        radius: 5

        Text {
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            text: "字数: " + textArea.text.length
            color: "#000000"
        }
    }

    // 文件操作函数
    function newFile() {
        textArea.text = ""
        currentFilePath = ""
    }

    function openFile() {
        openFileDialog.open()
    }

    function saveFile() {
        if (currentFilePath === "") {
            saveFileDialog.open()
        } else {
            var file = Qt.openFile(currentFilePath, "w")
            if (file) {
                file.write(textArea.text)
                file.close()
            }
        }
    }

    function saveAsFile() {
        saveFileDialog.open()
    }

    // 查找/替换函数
    function find() {
        findDialog.open()
    }

    function replace() {
        replaceDialog.open()
    }
} 