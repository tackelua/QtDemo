import QtQuick 2.5
import "qrc://js/js/helper.js" as Helper

Item {
    id: appContainerItem
    property string name
    property alias active: appShow.active

    function setSource(qml) {
        appShow.setSource(qml)
    }

    anchors.fill: parent
    visible: active

    Column {
        visible: active
        width: parent.width
        height: parent.height

        Rectangle {
            id: header
            width: parent.width
            height: 100
            color: "#1181d6"

            Rectangle{
                id: back
                anchors.left: header.left
                width: 2 * height
                height: header.height
                color: Qt.lighter(parent.color)
                Text {
                    anchors.centerIn: parent
                    text: "Back"
                    color: Qt.darker(Helper.invertColor(back.color), 1.2)
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: active = false
                }
            }
            Rectangle{
                id: name
                anchors.left: back.right
                width: header.width - 2 * back.width
                height: header.height
                color: header.color
                Text {
                    anchors.centerIn: parent
                    text: appContainerItem.name
                    color: Qt.lighter(Helper.invertColor(name.color))
                }
            }
            Rectangle{
                id: quit
                anchors.left: name.right
                width: back.width
                height: header.height
                color: Qt.darker(header.color)
                Text {
                    anchors.centerIn: parent
                    text: "Quit"
                    color: Qt.lighter(Helper.invertColor(quit.color))
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: Qt.quit()
                }
            }
        }

        Rectangle{
            width: parent.width
            height: parent.height - 100
            color: "transparent"

            Loader {
                id: appShow
                active: false
                visible: active
                anchors.centerIn: parent
                focus: true
            }
        }

    }

    Rectangle {
        anchors.fill: parent
        z: -1
        color: Qt.darker("darkgray", 3)

        MouseArea {
            anchors.fill: parent
            onClicked: {}
        }
    }
}
