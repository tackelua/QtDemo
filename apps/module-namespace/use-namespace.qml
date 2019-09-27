import QtQuick 2.5
import "items" as CustomItems

Rectangle {
    width: 250; height: 100; color: "lightblue"

    CustomItems.CheckBox {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }
}
