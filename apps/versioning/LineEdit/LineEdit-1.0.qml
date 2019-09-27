/*************************************************************************
 *
 * Copyright (c) 2016 Qt Company
 * All rights reserved.
 *
 * See the LICENSE.txt file shipped along with this file for the license.
 *
 *************************************************************************/

import QtQuick 2.5

Rectangle {
    border.color: "green"
    color: "yellow"
    radius: 4; smooth: true
    clip: true

    TextInput {
        anchors.fill: parent
        anchors.margins: 2
        text: qsTr("Version 1.0...")
        color: focus ? "black" : "gray"
        font.pixelSize: parent.height - 4
    }
}
