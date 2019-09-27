import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Particles 2.0

Window {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    color: "transparent"
    onActiveChanged: {
        window.visibility = activeFocusItem ? Window.FullScreen : Window.Minimized;
    }

    MouseArea{
        anchors.fill: parent
        onClicked: window.close();
    }

    Rectangle {
        anchors.fill: parent
        color: "transparent"

        Timer {
            interval: 2000
            running: true
            repeat: true
            onTriggered: emitter.burst(100)
        }

        ParticleSystem {
            anchors.fill: parent

            Emitter {
                id: emitter
                anchors.fill: parent

                enabled: true
                lifeSpan: 2000
                size: 32
                emitRate: 200
            }

            ImageParticle {
                source: "qrc:/images/particle.png"
                sizeTable: "qrc:/imagesimages/imagessizeTable.png"
                redVariation: 100
                greenVariation: 100
                blueVariation: 100
            }
        }
    }

}
