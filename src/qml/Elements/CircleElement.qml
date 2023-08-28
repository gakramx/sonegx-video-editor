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
    property point originalPosition
    Drag.active: drage.drag.active
    MouseArea {
        id:drage
        width: parent.width
        height: parent.height
        property Item newCircleElement: null
        onPressed: (mouse)=>{
                       if (parent.isChild==false){
                           newCircleElement = createNewCircleElement(mouse.x,mouse.y);
                           drage.drag.target=newCircleElement
                           newCircleElement.Drag.active= true
                       }
                       else{
                           drage.drag.target=parent
                           originalPosition = Qt.point(parent.x, parent.y);

                       }
                   }
        onReleased: (mouse) => {
                        if (drage.newCircleElement) {
                            if (videoPlayer.dropArea.containsDrag) {
                                // Drop inside the DropArea, update the color of the dropped instance
                                drage.newCircleElement.color = "blue";
                                newCircleElement.Drag.active=false
                            } else {
                                drage.newCircleElement.destroy();
                            }
                        }
                        if (drage.drag.target==parent) {
                            parent.Drag.active= true
                            if (videoPlayer.dropArea.containsDrag) {
                                // Drop inside the DropArea, update the color of the dropped instance
                                drage.drag.target.color = "green";
                                drage.drag.target.Drag.active= false
                            } else {
                                console.log("restore")
                                drage.drag.target.x = originalPosition.x;
                                drage.drag.target.y = originalPosition.y;
                                drage.drag.target.Drag.active= false
                            }

                        }

                    }
        onPositionChanged: (mouse)=>{
                               if(drage.drag.active && newCircleElement!=null)
                               drage.newCircleElement.parent= splitView.parent
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
