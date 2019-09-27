import QtQuick 2.5
import "../../js/helper.js" as Helper

Item {
    id: myItem
    property real margin: 35

    function randomColor() {
        return Helper.randomHexColor()
    }

    width: 400
    height: 400

    Rectangle {
        id: square11
        color: randomColor()
        anchors {
            top: parent.top
            topMargin: margin
            left: parent.left
            leftMargin: margin
        }
        width: parent.width * 0.375
        height: parent.height * 0.375
    }

    Rectangle {
        id: square12
        color: randomColor()
        anchors {
            top: parent.top
            topMargin: margin
            left: square11.right
            leftMargin: margin
        }
        width: parent.width * 0.375
        height: parent.height * 0.375
    }

    Rectangle {
        id: square21
        color: randomColor()
        anchors {
            top: square11.bottom
            topMargin: margin
            left: parent.left
            leftMargin: margin
        }
        width: parent.width * 0.375
        height: parent.height * 0.375
    }

    Rectangle {
        id: square22
        color: randomColor()
        anchors {
            top: square12.bottom
            topMargin: margin
            left: square21.right
            leftMargin: margin
        }
        width: parent.width * 0.375
        height: parent.height * 0.375
    }

    Rectangle {
        id: colorDot
        width: 30
        height: width
        radius: width / 2
        anchors.centerIn: parent
        color: randomColor()

        states: [
            State {
                name: "square0"
                PropertyChanges {
                    target: colorDot
                    parent: square11
                }
            },
            State {
                name: "square1"
                PropertyChanges {
                    target: colorDot
                    parent: square12
                }
            },
            State {
                name: "square2"
                PropertyChanges {
                    target: colorDot
                    parent: square21
                }
            },
            State {
                name: "square3"
                PropertyChanges {
                    target: colorDot
                    parent: square22
                }
            }
        ]
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            var s = "square" + parseInt(Math.random() * 4)
            while (colorDot.state === s) {
                s = "square" + parseInt(Math.random() * 4)
            }
            colorDot.state = s
            print(colorDot.state)
        }
    }
}
