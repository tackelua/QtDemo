import QtQuick 2.0

ListModel {
    id: appModel
    ListElement {
        name: "borderimage"
        qml: "/apps/borderimage/borderimage.qml"
    }
    ListElement {
        name: "versioning"
        qml: "/apps/versioning/versioning.qml"
    }
    ListElement {
        name: "namespace"
        qml: "/apps/module-namespace/use-namespace.qml"
    }
    ListElement {
        name: "KeyNavigation"
        qml: "/apps/KeyNavigation/menu-screen.qml"
    }
    ListElement {
        name: "States and Transitions"
        qml: "/apps/States and Transitions/states and transitions.qml"
    }
    ListElement {
        name: "Parent Change"
        qml: "/apps/ParentChange/parentchange.qml"
    }
    ListElement {
        name: "Animattions"
        qml: "/apps/animations/animations.qml"
    }
    ListElement {
        name: "Tinhte RSS"
        qml: "/apps/Tinhte RSS/rss.qml"
    }
    ListElement {
        name: "Tab Bar"
        qml: "/apps/TabBar/tabbar.qml"
    }
    ListElement {
        name: "Screen Saver"
        qml: "/apps/ScreenSaver/screen-saver.qml"
    }
}
