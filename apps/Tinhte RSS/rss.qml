import QtQuick 2.0
import QtQuick.XmlListModel 2.0

Item {
    width: 1200
    height: 600
    XmlListModel {
        id: rssNews
        source: "https://tinhte.vn/rss"
        query: "/rss/channel/item"
        XmlRole {
            name: "title"
            query: "title/string()"
        }
        XmlRole {
            name: "description"
            query: "description/string()"
        }
        XmlRole {
            name: "pubDate"
            query: "pubDate/string()"
        }
        XmlRole {
            name: "link"
            query: "link/string()"
        }
    }

    Component {
        id: layout
        Item {
            width: parent.width
            height: 100
            Column {
                width: parent.width
                Text {
                    text: title
                    font.bold: true
                    color: "lightcyan"
                    Component.onCompleted: font.pixelSize = font.pixelSize * 1.5
                }
                Text {
                    text: pubDate
                    font.italic: true
                    color: Qt.darker("lightcyan")
                }
                Rectangle {
                    width: parent.width
                    height: 20
                    color: "transparent"
                }
                Rectangle {
                    width: parent.width
                    height: 1
                    opacity: 0.6
                }
            }
        }
    }

    Rectangle {
        width: parent.width
        height: parent.height - y
        y: 30
        color: "transparent"

        ListView {
            anchors.fill: parent
            model: rssNews
            delegate: layout
        }
        clip: true
    }
}
