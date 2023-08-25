import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic
import QtQuick.Layouts

Rectangle {
    id:circleElement
    width: 80
    height: 100
    color: "#00000000"
    Rectangle {
        width: 60
        height: 60
        color: "#048659"
        radius: width / 2
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Label {
        id: labelElement
        text: qsTr("Point")
        anchors.bottom: parent.bottom
        font.pointSize: 14
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: 1
    }

}
