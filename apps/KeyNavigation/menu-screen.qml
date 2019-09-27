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

        focus: true

        MouseArea {
            anchors.fill: parent
            onClicked: parent.focus = true
        }
        onFocusChanged: {
            if (focus) {
                color = randomColor()
            }
        }

        KeyNavigation.right: square12
        KeyNavigation.left: square22
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

        MouseArea {
            anchors.fill: parent
            onClicked: parent.focus = true
        }
        onFocusChanged: {
            if (focus) {
                color = randomColor()
            }
        }

        KeyNavigation.right: square21
        KeyNavigation.left: square11
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

        MouseArea {
            anchors.fill: parent
            onClicked: parent.focus = true
        }
        onFocusChanged: {
            if (focus) {
                color = randomColor()
            }
        }

        KeyNavigation.right: square22
        KeyNavigation.left: square12
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

        MouseArea {
            anchors.fill: parent
            onClicked: parent.focus = true
        }
        onFocusChanged: {
            if (focus) {
                color = randomColor()
            }
        }

        KeyNavigation.right: square11
        KeyNavigation.left: square21
    }
}
