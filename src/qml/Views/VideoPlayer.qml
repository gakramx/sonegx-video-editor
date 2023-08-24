import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic
import QtMultimedia
import QtQuick.Layouts
Rectangle {
    id:videoPlayer
    Rectangle{
        id: videoSpace
        border.width:5
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: rowLayoutButtons.top
        anchors.bottomMargin: 10
        anchors.topMargin: 0
        anchors.leftMargin: 0
        anchors.rightMargin: 0
        color:"red"
        Video{
            id:player
            anchors.fill: parent
        }
    }


    RowLayout{
        id:rowLayoutButtons
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        anchors.leftMargin: parent.width /5
        anchors.rightMargin:  parent.width /5
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
