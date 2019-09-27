import QtQuick 2.5

Item {
    width: 500
    height: 500
    anchors.centerIn: parent
    Switch {
        id: sw
        anchors.fill: parent
    }
    MouseArea {
        anchors.fill: parent
        onClicked: {
            print('click')
            if (sw.state == "on") {
                sw.state = "off"
            } else {
                sw.state = "on"
            }
        }
    }
}
