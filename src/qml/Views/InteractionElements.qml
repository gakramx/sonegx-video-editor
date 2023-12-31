import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic
import QtQuick.Layouts
import "../Elements" as Elements
GroupBox {
    id: interactionelements
    title: qsTr("Interaction elements")
    Layout.fillHeight: true
    Layout.fillWidth: true
    Layout.alignment: Qt.AlignHCenter | Qt.AlignTop

    property QtObject mainWindow: mainwin


    Flickable{
        anchors.fill: parent
        clip: true
        contentWidth:itemPropertiesColumnLayout.implicitWidth
        contentHeight: itemPropertiesColumnLayout.implicitHeight
        boundsBehavior: Flickable.StopAtBounds
        interactive:true
        flickableDirection:Flickable.VerticalFlick
        ScrollBar.vertical: ScrollBar {}
        ColumnLayout {
            id:itemPropertiesColumnLayout
            anchors.fill: parent
            Elements.CircleElement{
                id:circleElement
            }

        }
    }
}

