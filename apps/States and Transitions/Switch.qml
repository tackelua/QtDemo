import QtQuick 2.5
import "../../js/helper.js" as Helper

Item {
    id: switchBtn
    function colorDark() {
        return Qt.darker(Helper.randomHexColor())
    }
    function colorLight() {
        return Qt.lighter(Helper.randomHexColor(), 3)
    }
    anchors.fill: parent
    property int cellSize: 100
    property color colorTop: "white"
    property color colorBottom: "black"

    Rectangle {
        id: gradient
        anchors.fill: parent
        gradient: Gradient {
            GradientStop {
                position: 0.0
                color: colorTop
            }
            GradientStop {
                position: 0.07
                color: colorTop
            }
            GradientStop {
                position: 0.93
                color: colorBottom
            }
            GradientStop {
                position: 1.0
                color: colorBottom
            }
        }
    }
    Rectangle {
        id: statusBar
        anchors.right: gradient.right
        width: 5
        height: gradient.height
        color: "darkgray"
        Rectangle {
            id: redBar
            width: statusBar.width
            height: statusBar.height / 2
            color: "red"
        }
    }

    states: [
        State {
            name: "on"
            PropertyChanges {
                target: switchBtn
                colorTop: colorTopTmp
                colorBottom: colorBottomTmp
            }
            PropertyChanges {
                target: redBar
                y: 0
            }
            PropertyChanges {
                target: switchBtn
                stt: true
            }
        },
        State {
            name: "off"
            PropertyChanges {
                target: switchBtn
                colorTop: colorTopTmp
                colorBottom: colorBottomTmp
            }
            PropertyChanges {
                target: redBar
                y: statusBar.height / 2
            }
            PropertyChanges {
                target: switchBtn
                stt: false
            }
        }
    ]

    state: "off"

    property bool stt: state == "on"
    property color colorTopTmp: colorDark()
    property color colorBottomTmp: colorLight()

    onSttChanged: {
        if(stt) {
            colorTopTmp = colorDark()
            colorBottomTmp = colorLight()
        }
        else{
            colorTopTmp = colorLight()
            colorBottomTmp = colorDark()
        }
        colorTopTmp = colorTopTmp
        colorBottomTmp = colorBottomTmp
    }
    onColorTopTmpChanged: {
        print(colorTopTmp)
    }

    transitions: Transition {
        from: "*"
        to: "*"

        PropertyAnimation {
            target: switchBtn
            properties: "colorTop, colorBottom"
            duration: 1000
        }
        PropertyAnimation {
            target: redBar
            properties: "y"
            duration: 1000
        }
    }
}
