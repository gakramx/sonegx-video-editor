import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
GroupBox {
    id: itemProperties
    title: qsTr("Item Properties")
    Layout.fillHeight: true
    Layout.fillWidth: true
    Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
    ScrollView{
        anchors.fill: parent
        ColumnLayout {
            anchors.fill: parent
            CheckBox { text: qsTr("E-mail") }
            CheckBox { text: qsTr("Calendar") }
            CheckBox { text: qsTr("Contacts") }
        }
    }
}
