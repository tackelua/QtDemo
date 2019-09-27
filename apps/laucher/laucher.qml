import QtQuick 2.5
import "qrc://js/js/helper.js" as Helper

Item {
    id: laucher
    //    property int cellSize: 250
    property int cellSizeW: 200
    property int cellSizeH: 100
    property int spacing: 20
    anchors.fill: parent

    Component {
        id: componentDelegate
        Item {
            id: itemDelegate
            width: cellSizeW
            height: width * 0.4
            Rectangle {
                id: delegateRect
                anchors.fill: parent
                radius: width * 0.4
                color: Helper.randomHexColor()
            }
            Text {
                id: delegateText
                anchors.centerIn: parent
                text: name
                font.pixelSize: 16
                color: Helper.invertColor(delegateRect.color)
            }
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    parent.state = "focus"
                }
                onExited: {
                    parent.state = "normal"
                }
                onClicked: {
                    appContainer.name = name
                    appContainer.setSource(qml)
                    print(qml)
                    appContainer.active = true
                }
            }

            states: [
                State {
                    name: "focus"
                    PropertyChanges {
                        target: itemDelegate
                        focus: true
                    }
                },
                State {
                    name: "normal"
                    PropertyChanges {
                        target: itemDelegate
                        focus: false
                    }
                }
            ]
            state: "normal"

            onFocusChanged: {
                if (focus) {
                    delegateRect.border.width = 1
                    delegateRect.border.color = "darkblue"
                } else {
                    delegateRect.border.width = 0
                    delegateRect.border.color = "transparent"
                }
            }
        }
    }
    GridView {
        id: gridApps
        width: Math.min(Math.floor(laucher.width / (cellSizeW + spacing)) * (cellSizeW + spacing), gridApps.count * (cellSizeW + spacing))
        height: Math.round((gridApps.count / (gridApps.width / (cellSizeH + spacing)))+ 0.4) * (cellSizeH + spacing) - spacing
        anchors {
            left: parent.left
            leftMargin: (laucher.width - width + spacing) / 2
            verticalCenter: parent.verticalCenter
        }
        cellWidth: cellSizeW + spacing
        cellHeight: cellSizeH + spacing

        model: ListApps {
        }
        delegate: componentDelegate
    }

    AppContainer {
        id: appContainer
        active: false
        visible: active
        anchors.fill: parent
    }
}
