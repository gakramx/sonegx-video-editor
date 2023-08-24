import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Controls.Basic
import QtQuick.Layouts
import "Views" as Views
ApplicationWindow {
    id:mainwin
    width: 640
    height: 480
    visible: true
    title: qsTr("Sonegx video editor")
    palette: darkTheme
    menuBar: MenuBar {
        palette.dark: "#888a96"
        Menu {

            title: qsTr("&File")
            Action { text: qsTr("&New...") }
            Action { text: qsTr("&Open...") }
            Action { text: qsTr("&Save") }
            Action { text: qsTr("Save &As...") }
            MenuSeparator { }
            Action { text: qsTr("&Quit") }
        }
        Menu {
            title: qsTr("&Edit")
            Action { text: qsTr("Cu&t") }
            Action { text: qsTr("&Copy") }
            Action { text: qsTr("&Paste") }
        }
        Menu {
            title: qsTr("&Help")
            Action { text: qsTr("&About") }
        }
    }
    SplitView {
        id: splitView
        anchors.fill: parent

        orientation: Qt.Horizontal
        ColumnLayout {
            id:propertyColumnLayout
            width: parent.width/5
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            anchors.leftMargin: 5
            anchors.topMargin: 5
            spacing: 5
            clip: true
            Views.ItemProperties{}
            Views.InteractionElements{}

        }
        Views.VideoPlayer{
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            anchors.rightMargin: 5
            anchors.topMargin: 5
        }
    }
    Palette {
        id: darkTheme
        alternateBase: "#36383e"
        base: "#31313a"
        button: "#44454b"
        buttonText: "#eaeaea"
        dark: "#5657f5"
        highlight: "#5657f5"
        highlightedText: "#ffffff"
        light: "#222225"
        mid: "#5a5c64"
        midlight: "#4c4e54"
        placeholderText: "#7fffffff"
        shadow: "#000000"
        text: "#eaeaea"
        window: "#31313a"
        windowText: "#eaeaea"
    }
    Component.onCompleted: {
    }
}
