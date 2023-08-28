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
            SplitView.minimumWidth: parent.width/5
            SplitView.preferredWidth: parent.width/5
            SplitView.maximumWidth:parent.width/4
            spacing: 5
            clip: true
            Views.ItemProperties{}
            Views.InteractionElements{

            }

        }

        SplitView {
            id: splitView1
            orientation: Qt.Vertical
            SplitView.fillWidth: true

            SplitView {
                id: splitView2
                SplitView.fillWidth: true
                SplitView.fillHeight: true
                orientation: Qt.Horizontal

                Rectangle{
                    SplitView.fillHeight: true
                    SplitView.minimumWidth: parent.width/5
                    SplitView.preferredWidth: parent.width/5
                    SplitView.maximumWidth:parent.width/4
                    color:"#00000000"
                }
                Views.VideoPlayer{
                    id:videoPlayer

                }

            }
            Rectangle{
                SplitView.fillWidth: true
                SplitView.minimumHeight: 50
                SplitView.preferredHeight: 50
                SplitView.maximumHeight: 100

                color:"#00000000"
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
