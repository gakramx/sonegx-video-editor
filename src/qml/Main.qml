import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Controls.Basic
import QtQuick.Layouts
import "Views" as Views


ApplicationWindow {
    id:mainwin
    width: 1200
    height: 700
    // Set minimum width and height
    minimumWidth: 1200
    minimumHeight: 700
    visible: true
    title: qsTr("Sonegx video editor")
    palette: darkTheme
    property Item videoPlayer: videoPlayer
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
            SplitView.fillHeight: true
            SplitView.minimumWidth: parent.width/7
            SplitView.preferredWidth: parent.width/7
            SplitView.maximumWidth:parent.width/6
            spacing: 5
            clip: true
            Views.ItemProperties{}
            Views.InteractionElements{
            }

        }
        SplitView {
            id: splitView1
            orientation: Qt.Horizontal
            SplitView.fillWidth: true
            Rectangle{
                SplitView.fillHeight: true
                SplitView.minimumWidth: parent.width/7
                SplitView.preferredWidth: parent.width/7
                SplitView.maximumWidth:parent.width/6
                color:"#00000000"
            }
            Views.VideoPlayer{
                id:videoPlayer

            }
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
