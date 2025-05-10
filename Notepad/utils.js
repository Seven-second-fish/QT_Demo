// 文件操作函数
function readFile(filePath) {
    var file = Qt.openFile(filePath, "r");
    if (file) {
        var content = file.readAll();
        file.close();
        return content;
    }
    return "";
}

function writeFile(filePath, content) {
    var file = Qt.openFile(filePath, "w");
    if (file) {
        file.write(content);
        file.close();
        return true;
    }
    return false;
}

// 字数统计函数
function countWords(text) {
    return text.length;
}

// 导出函数
Qt.include("utils.js"); 