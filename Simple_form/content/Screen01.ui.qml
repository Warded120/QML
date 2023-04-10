import QtQuick 6.2
import QtQuick.Controls 6.2
Rectangle {
id: rectangle

width: 400
height: 200
color: "#cccccc"

Button {
id: button
text: qsTr("Тисни")
anchors.verticalCenter: parent.verticalCenter
highlighted: false
checkable: true
anchors.horizontalCenter: parent.horizontalCenter

Connections {
target: button
onClicked: animation.start()
}
}

Text {
id: label

text: qsTr("Привіт")
anchors.top: button.bottom
font.family: Constants.font.family
anchors.topMargin: 45
anchors.horizontalCenter: parent.horizontalCenter

SequentialAnimation {
id: animation

ColorAnimation {
id: colorAnimation1
target: rectangle
property: "color"
to: "#2294c6"
from: Constants.backgroundColor
}

ColorAnimation {
    id: colorAnimation2
    target: rectangle

    property: "color"
    to: Constants.backgroundColor
    from: "#2294c6"
}
}
}
states: [
State {
name: "clicked"
when: button.checked

PropertyChanges {
target: label
text: qsTr("Кнопка натиснена")
}
}
]
}
