import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic
import QtMultimedia
import QtQuick.Layouts
Rectangle {
    id:videoPlayer
    color:"#00000000"
    property Item dropArea: dropArea
    property Item videoArea: videoArea
    property Item player: player
    Rectangle{
        id:videoArea
        width: 854
        height: 480
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        DropArea {
            id: dropArea
            anchors.fill: parent
            onDropped: {console.log("Test")}
            onContainsDragChanged: {
                if (containsDrag) {
                    console.log("containsDrag")
                } else {
                    console.log("No containsDrag")
                }
            }
            onEntered: {

                console.log("ENTERED")
            }
            Rectangle {
                anchors.fill: parent
                id: videoPlayer2
                color: "red"
            }
        }
        Video{
            id:player
            anchors.fill: parent
            onSourceChanged:play_btn.enabled=true
            onPlaybackStateChanged: {
            }
            function playPause(){
                if(player.playbackState === MediaPlayer.PlayingState){
                    play_btn.text= "Play"
                 player.pause()
                }

                else{
                    play_btn.text= "Stop"
                  player.play()
                }
            }
        }

    }
    Slider {
        id: progressSlider
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: rowLayoutButtons.top
        anchors.rightMargin: 20
        anchors.leftMargin: 20
        anchors.bottomMargin: 10
        z: 1
        enabled: player.seekable
        value: player.duration > 0 ? player.position / player.duration : 0
        onWidthChanged: {
        }
        onHeightChanged: {
        }
        background: Rectangle {
            id: progressRect
            implicitHeight: 4
            color: "white"
            radius: 3
            anchors.verticalCenter: parent.verticalCenter
            width: progressSlider.availableWidth
            height: implicitHeight
            x: progressSlider.leftPadding
            Rectangle {
                id: progressSliderRect
                width: progressSlider.visualPosition * parent.width
                height: parent.height
                color: "#1D8BF8"
                radius: 3
            }
        }

        handle: Rectangle {

            x: progressSlider.leftPadding + progressSlider.visualPosition
               * (progressSlider.availableWidth - width)
            y: progressSlider.topPadding
               + progressSlider.availableHeight / 2 - height / 2
            implicitWidth: 12
            implicitHeight: 12
            radius: 13
            color: progressSlider.pressed ? "#1b2631" : "#f6f6f6"
            border.color: "#bdbebf"

            antialiasing: true
        }
        onMoved: function () {
            player.position = player.duration * progressSlider.position
        }
        Component.onCompleted: {
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
            id: play_btn
            enabled: !player.source
            text: "Play"
            onClicked: player.playPause()
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        }
        Button {
            id: button2
            text: qsTr("Button")
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        }
    }
}
