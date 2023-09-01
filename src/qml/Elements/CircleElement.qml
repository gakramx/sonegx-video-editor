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
    SequentialAnimation {
        id: scaleAnimation
        NumberAnimation { target: drage.newCircleElement; property: "scale"; to: 1.2; duration: 100 }
        NumberAnimation { target: drage.newCircleElement; property: "scale"; to: 1; duration: 100; running: false }
    }
    MouseArea {
        id:drage
        width: parent.width
        height: parent.height
        property Item newCircleElement: null
        onPressed: (mouse)=>{
                       if (parent.isChild==false){
                           newCircleElement = createNewCircleElement(mouse.x,mouse.y);
                           newCircleElement.height=40
                           newCircleElement.width=40
                           drage.drag.target=newCircleElement
                           newCircleElement.Drag.active= true
                       }
                       else{
                           drag.minimumX= 0
                           drag.maximumX= videoPlayer.dropArea.parent.width - parent.width
                           drag.minimumY= 0
                           drag.maximumY= videoPlayer.dropArea.parent.height - parent.height
                           drage.drag.target=parent
                           originalPosition = Qt.point(parent.x, parent.y);
                       }
                   }
        onReleased: (mouse) => {
                        if (drage.newCircleElement) {
                            var itemLeft = drage.newCircleElement.x;
                            var itemRight = drage.newCircleElement.x + drage.newCircleElement.width;
                            var itemTop = drage.newCircleElement.y;
                            var itemBottom = drage.newCircleElement.y + drage.newCircleElement.height;

                            var dropAreaLeft = videoPlayer.dropArea.x;
                            var dropAreaRight = videoPlayer.dropArea.x + videoPlayer.dropArea.width;
                            var dropAreaTop = videoPlayer.dropArea.y;
                            var dropAreaBottom = videoPlayer.dropArea.y + videoPlayer.dropArea.height;

                            if (videoPlayer.dropArea.containsDrag &&
                                itemLeft >= dropAreaLeft &&
                                itemRight <= dropAreaRight &&
                                itemTop >= dropAreaTop &&
                                itemBottom <= dropAreaBottom
                                ) {
                                // The entire item is inside the drop area and contains a drag, allow dropping
                                drage.newCircleElement.color = "blue";
                                drage.newCircleElement.Drag.active = false;
                                scaleAnimation.start()
                            } else {
                                // Either the item is not fully inside the drop area or no drag is present, disallow dropping
                                drage.newCircleElement.Drag.active = false;
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
                               drage.newCircleElement.parent=videoPlayer.videoArea  //splitView.parent
                               if (drage.newCircleElement) {
                                   var itemLeft = drage.newCircleElement.x;
                                   var itemRight = drage.newCircleElement.x + drage.newCircleElement.width;
                                   var itemTop = drage.newCircleElement.y;
                                   var itemBottom = drage.newCircleElement.y + drage.newCircleElement.height;

                                   var dropAreaLeft = videoPlayer.dropArea.x;
                                   var dropAreaRight = videoPlayer.dropArea.x + videoPlayer.dropArea.width;
                                   var dropAreaTop = videoPlayer.dropArea.y;
                                   var dropAreaBottom = videoPlayer.dropArea.y + videoPlayer.dropArea.height;

                                   if (videoPlayer.dropArea.containsDrag &&
                                       itemLeft >= dropAreaLeft &&
                                       itemRight <= dropAreaRight &&
                                       itemTop >= dropAreaTop &&
                                       itemBottom <= dropAreaBottom
                                       ) {
                                       // The entire item is inside the drop area and contains a drag, allow dropping
                                       drage.newCircleElement.color = "blue";
                                   } else {
                                       // Either the item is not fully inside the drop area or no drag is present, disallow dropping
                                       drage.newCircleElement.color = "green";
                                   }
                               }
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
        color: "#048659"
        radius: width / 2
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

        Component.onCompleted: {
            if(parent.isChild){
                width= 40
                height= 40
            }
            else {
                width= 60
                height= 60
            }
        }

    }

    Label {
        id: labelElement
        text: qsTr("Point")
        font.pointSize: 12
        Component.onCompleted: {
            if(parent.isChild){
                anchors.right= parent.right
                anchors.top= parent.top
                anchors.rightMargin=-labelElement.contentWidth
                anchors.topMargin= 0
            }
            else {
                anchors.bottom= parent.bottom
                anchors.horizontalCenter= parent.horizontalCenter
                anchors.bottomMargin= 1
            }

        }
    }
    Component.onCompleted: {

    }
}
