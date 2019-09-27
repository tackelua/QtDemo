import QtQuick 2.0
import "content"

Rectangle {
    id: page
    property color textColor: Qt.darker("silver")
    width: 1300
    height: 550

    Row {
        anchors.centerIn: parent
        spacing: 20

        Column {
            spacing: 20
            Text {
                text: "Stretch/Stretch"
                color: textColor
                anchors.horizontalCenter : parent.horizontalCenter
            }

            MyBorderImage {
                minWidth: 120
                maxWidth: 240
                minHeight: 120
                maxHeight: 200
                source: "content/colors.png"
                margin: 30
            }

            MyBorderImage {
                minWidth: 60
                maxWidth: 200
                minHeight: 40
                maxHeight: 200
                source: "content/bw.png"
                margin: 10
            }
        }

        Column {
            spacing: 20
            Text {
                text: "Repeat/Repeat"
                color: textColor
                anchors.horizontalCenter : parent.horizontalCenter
            }
            MyBorderImage {
                minWidth: 120
                maxWidth: 240
                minHeight: 120
                maxHeight: 200
                source: "content/colors.png"
                margin: 30
                horizontalMode: BorderImage.Repeat
                verticalMode: BorderImage.Repeat
            }

            MyBorderImage {
                minWidth: 60
                maxWidth: 200
                minHeight: 40
                maxHeight: 200
                source: "content/bw.png"
                margin: 10
                horizontalMode: BorderImage.Repeat
                verticalMode: BorderImage.Repeat
            }
        }

        Column {
            spacing: 20
            Text {
                text: "Stretch/Repeat"
                color: textColor
                anchors.horizontalCenter : parent.horizontalCenter
            }
            MyBorderImage {
                minWidth: 120
                maxWidth: 240
                minHeight: 120
                maxHeight: 200
                source: "content/colors.png"
                margin: 30
                horizontalMode: BorderImage.Stretch
                verticalMode: BorderImage.Repeat
            }

            MyBorderImage {
                minWidth: 60
                maxWidth: 200
                minHeight: 40
                maxHeight: 200
                source: "content/bw.png"
                margin: 10
                horizontalMode: BorderImage.Stretch
                verticalMode: BorderImage.Repeat
            }
        }

        Column {
            spacing: 20
            Text {
                text: "Round/Round"
                color: textColor
                anchors.horizontalCenter : parent.horizontalCenter
            }
            MyBorderImage {
                minWidth: 120
                maxWidth: 240
                minHeight: 120
                maxHeight: 200
                source: "content/colors.png"
                margin: 30
                horizontalMode: BorderImage.Round
                verticalMode: BorderImage.Round
            }

            MyBorderImage {
                minWidth: 60
                maxWidth: 200
                minHeight: 40
                maxHeight: 200
                source: "content/bw.png"
                margin: 10
                horizontalMode: BorderImage.Round
                verticalMode: BorderImage.Round
            }
        }

        Column {
            spacing: 20
            Text {
                text: "Stretch/Round"
                color: textColor
                anchors.horizontalCenter : parent.horizontalCenter
            }
            MyBorderImage {
                minWidth: 120
                maxWidth: 240
                minHeight: 120
                maxHeight: 200
                source: "content/colors.png"
                margin: 30
                horizontalMode: BorderImage.Stretch
                verticalMode: BorderImage.Round
            }

            MyBorderImage {
                minWidth: 60
                maxWidth: 200
                minHeight: 40
                maxHeight: 200
                source: "content/bw.png"
                margin: 10
                horizontalMode: BorderImage.Stretch
                verticalMode: BorderImage.Round
            }
        }
    }
}
