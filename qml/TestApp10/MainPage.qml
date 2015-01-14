import QtQuick 1.1
import com.nokia.meego 1.0
import com.nokia.extras 1.1

Page {
    tools: commonTools
    anchors.leftMargin: UiConstants.DefaultMargin

    Label {
        id: myTitle
        color: "white"
        font: UiConstants.SmallTitleFont
        text : "TestApp10"
        anchors.top: parent.top
    }
    Label {
        id: timerStatus
        font: UiConstants.SubtitleFont
        anchors.top: myTitle.bottom
        Connections {
            target: mytimer
            onTimerMessage: {
                timerStatus.text = myMessage;
            }
        }
    }
    Label {
        id: timerDisplay
        color: "red"
        font.pixelSize: 128
        text : ""
        anchors.centerIn: parent
        Connections {
            target: mytimer
            onValueChanged: {
                timerDisplay.text = minAndSec
            }
        }
        MouseArea {
            anchors.fill:parent
            onClicked: {
                mytimer.start()
            }
        }
    }
    TimePickerDialog {
        id: tDialog
        titleText: "Set timer"
        fields: DateTime.Minutes | DateTime.Seconds
        acceptButtonText: "OK"
        rejectButtonText: "Cancel"
        onAccepted: {
            mytimer.set(tDialog.minute,tDialog.second)
        }
    }
    ToolBarLayout {
        id: commonTools
        visible: true
        ToolIcon {
            platformIconId: "toolbar-view-menu"
            anchors.right: (parent === undefined) ? undefined : parent.right
            onClicked: (myMenu.status === DialogStatus.Closed) ? myMenu.open() : myMenu.close()
        }
    }
    Menu {
        id: myMenu
        visualParent: pageStack
        MenuLayout {
            MenuItem {
                text: qsTr("Set timer")
                onClicked: tDialog.open()
            }
            MenuItem {
                text: qsTr("Start timer")
                onClicked: mytimer.start()
            }
            MenuItem {
                text: qsTr("Reset timer")
                onClicked: mytimer.reset()
            }
        }
    }

}
