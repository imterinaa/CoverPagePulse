import QtQuick 2.6
import Sailfish.Silica 1.0


CoverBackground {

    property bool active: status == Cover.Active
    property int count: 50
    property int  flag: 0
    property real sf: 1.5

    Timer {
        id:timer
        interval: 7000 // 7 second interval
        running: false
        repeat: true
        onTriggered: {
            var pulse =50;
            if (flag === 0){
            count+=10;}
            else{
            timer.running = false;
            timer.repeat = false;}
            pulseSize.text = count
            if(pulseSize.text>200){
            flag=1;
            }
            if(pulseSize.text>150){
            pulse=250;

            }
            else if(pulseSize.text>100){
            pulse = 200;}
            else if(pulseSize.text>80){
            pulse = 150;
            }

            ourgif.source = "../../data/gifs/h" + pulse +".gif";}
    }


Column {

    anchors.topMargin: Theme.paddingMedium
    anchors.top: parent.top

    anchors.left: parent.left
    anchors.leftMargin: Theme.paddingMedium
    anchors.right: parent.right
    anchors.rightMargin: Theme.paddingMedium

    anchors.bottom: parent.bottom
    anchors.bottomMargin: Theme.paddingMedium


    spacing: 6
    Label {
        id: coverLabel
        text: "Pulse"
        horizontalAlignment:Text.AlignHCenter
        font.pixelSize: Theme.fontSizeSmall
        color: Theme.highlightColor

    }

    Image {
        id: ourgif
        source: ""
        fillMode: Image.PreserveAspectFit
        anchors.left: parent.left
        anchors.leftMargin: Theme.paddingMedium
        anchors.right: parent.right
        anchors.rightMargin: Theme.paddingMedium
        opacity: 0.6
    }
    AnimatedImage {
            id: speedgif
            anchors.centerIn: parent
            source: ourgif.source
            onFrameChanged: {

            }
        }


    Label {
        id: pulseSize
        font.pixelSize: Theme.fontSizeSmall
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        horizontalAlignment:Text.AlignHCenter
        color: Theme.primaryColor

    }
}


CoverActionList {
    id: coverAction

    CoverAction {
        iconSource: "image://theme/icon-cover-next"
        onTriggered : {timer.running = true;}

    }

}



}
