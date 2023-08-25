import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic
import QtMultimedia
import QtQuick.Layouts
Rectangle {
    id:videoPlayer
    color:"#00000000"
    Rectangle{
        id: videoSpace
        border.width:3
        border.color: "#5a5c64"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: rowLayoutButtons.top
        anchors.bottomMargin: 10
        anchors.topMargin: 10
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        color:"#00000000"
        Video{
            id:player
            anchors.fill: parent
        }
    }
    RowLayout{
        id:rowLayoutButtons
        x: ( videoPlayer.width / 2 ) - ( width / 2 )
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        clip:true
        Button {
            id: button
            text: qsTr("Button")
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        }

        Button {
            id: button1
            text: qsTr("Button")
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        }
        Button {
            id: button2
            text: qsTr("Button")
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        }
    }
}
