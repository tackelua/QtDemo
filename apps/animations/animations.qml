import QtQuick 2.0
import "../../js/helper.js" as Helper

Item {
    function randomColor() {
        return Helper.randomHexColor()
    }

    width: 1200
    height: 600

    Rectangle {
        id: signalLight
        width: 100
        height: width * 2
        color: "transparent"
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin: parent.height / 3
        Rectangle {
            id: stopLight
            width: parent.width
            height: width
        }
        Rectangle {
            id: goLight
            anchors.top: stopLight.bottom
            width: parent.width
            height: width
        }

        states: [
            State {
                name: "stop"
                when: car.x >= 1000
                PropertyChanges {
                    target: stopLight
                    color: "red"
                }
                PropertyChanges {
                    target: goLight
                    color: "black"
                }
            },
            State {
                name: "go"
                PropertyChanges {
                    target: stopLight
                    color: "black"
                }
                PropertyChanges {
                    target: goLight
                    color: "green"
                }
            }
        ]

        MouseArea {
            anchors.fill: parent
            onClicked: {
                if (signalLight.state === "stop")
                    signalLight.state = "go"
                else
                    signalLight.state = "stop"
                print(signalLight.state)
            }
        }
//        state: "stop"
        Component.onCompleted: signalLight.state = "stop"
    }


    Rectangle {
        y: parent.height / 2
        Image {
            id: car
            property bool run: signalLight.state === "go" ? true : false
            source: "car.png"
            width: 100
            height: width

            ParallelAnimation {
                running: car.run
                NumberAnimation {
                    target: car
                    property: "x"
                    to: 1000
                    duration: 5 * (1000 - car.x)
                }

                NumberAnimation {
                    loops: car.run ? Animation.Infinite : 0
                    target: car
                    property: "y"
                    to: Helper.randomInt(50)
                    duration: Helper.randomInt(500)
                }
            }
        }
    }
}
