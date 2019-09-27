import QtQuick 2.5

Rectangle {

    anchors.centerIn: parent
    color: "lightblue"

    Row {
        anchors.centerIn: parent
        Loader {
            source: "ver1.0.qml"
        }
        Loader {
            source: "ver1.1.qml"
        }
    }
}
