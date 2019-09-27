import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.0

ApplicationWindow {
    id: root
    visible: true
    width: 640
    height: 480
    title: qsTr("ApplicationWindow")
    color: "lightyellow"

    header: Label {
        horizontalAlignment: Qt.AlignHCenter
        text: qsTr("This is a header")
    }
    footer: TabBar {
        id: tabBar
        currentIndex: container.currentIndex
        TabButton {
            text: qsTr("Open a popup 1")
            onClicked: popup.open()
        }
        TabButton {
            text: qsTr("+")
            onClicked: {
                tabBar.addItem(tabButton.createObject(tabBar, {
                                                          "text": "Tab " + tabBar.count
                                                      }))
                print(tabBar.currentIndex)
            }
        }
        Component {
            id: tabButton
            TabButton {
                id: newTab
                text: "Tab defaut name"
                onClicked: {
                    print(tabBar.currentIndex)
                    tabBar.removeItem(tabBar.currentIndex)
                }
            }
        }
    }
    Popup {
        id: popup
        width: parent.width * 0.5
        height: parent.height * 0.5
        x: (parent.width - width) / 2
        y: (parent.height - height) / 2
        modal: true
        Text {
            anchors.centerIn: parent
            text: qsTr("Click to <b>Tab x</b> to remove it")
        }
    }
    Container {
        id: container
        contentItem: ListView {
            model: container.contentModel
        }
        Grid {
            id: grid
            property real imageWidth: 50
            columns: root.width / imageWidth

            Repeater {
                property int kakka: 7
                id: repeater
                model: 50

                BusyIndicator {
                    running: true
                    MouseArea {
                        anchors.fill: parent
                        onClicked: (parent.running) ? parent.running = false : parent.running = true
                    }
                }
            }
        }
    }
}
