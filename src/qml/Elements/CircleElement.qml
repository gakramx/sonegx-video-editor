import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic
import QtQuick.Layouts

Rectangle {
    id:circleElement
    width: 80
    height: 100
    color: "#00000000"
    property bool isChild: false
    MouseArea {
        id:drage
        width: parent.width
        height: parent.height
        property Item newCircleElement: null

        onPressed: (mouse)=>{
                       if (parent.isChild==false){
                           newCircleElement = createNewCircleElement(mouse.x,mouse.y);
                           newCircleElement.z=100
                           drage.drag.target=newCircleElement
                           console.log("parent",parent)
                           console.log("parent ",newCircleElement.parent)
                       }
                       else
                       drage.drag.target=parent
                   }
        onReleased: {
            // Assign a new state to the rectangle
        }

        onPositionChanged: (mouse)=>{
                               if(drage.drag.active)
                                drage.newCircleElement.parent=splitView.parent
                           }

    }

    function createNewCircleElement(mousePX,mousePY) {
        var component = Qt.createComponent("CircleElement.qml");
        if (component.status === Component.Ready) {
            return component.createObject(interactionelements, {
                                              "x": mousePX,
                                              "y": mousePY,
                                              "isChild":true
                                          });
        }

    }

    Rectangle {
        id:pointElement
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
