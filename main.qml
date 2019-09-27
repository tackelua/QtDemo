import QtQuick 2.12
import QtQuick.Controls 1.4
import "apps"

ApplicationWindow {
    visible: true
    width: 1280
    height: 720
    title: qsTr("Gith Demo")
    color: "transparent"

    Rectangle {
        anchors.fill: parent
        Rectangle {
            anchors.top: parent.top
            color: "#aa0ccc92"
            width: parent.width
            height: 2
        }

        gradient: Gradient {
            GradientStop {
                position: 0.0
                color: "#10000000"
            }
            GradientStop {
                position: 0.9
                color: Qt.darker("darkgray", 3)
            }
            GradientStop {
                position: 1.0
                color: Qt.darker("darkgray", 3)
            }
        }
    }

    Loader {
        id: loader
        anchors.fill: parent
        source: "apps/laucher/laucher.qml"
        active: true
        focus: active
    }

}
