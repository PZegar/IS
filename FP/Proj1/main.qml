import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Dialogs 1.2

import FP 1.0

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Model
    {
        id: model

        source: "../Proj1/data/test.txt"
    }

    Flow
    {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10

        Column
        {
            spacing: 5

            Button
            {
                text: "Select file..."
                onClicked: fileDialog.open()
            }

            Button
            {
                text: "Parse"
                onClicked: model.parseCSV()
            }

            Button
            {
                text: "Integrate"
                onClicked: model.integrate()
            }
        }

        Column
        {
            spacing: 5

            Label
            {
                text: "File: " + model.source
            }

            Label
            {
                text: "integral: " + model.integral
            }
        }
    }

    FileDialog {
        id: fileDialog

        title: "Please choose a file"
        folder: shortcuts.home

        onAccepted: model.source = fileDialog.fileUrl

        onRejected: console.log("Canceled")
    }

//    SwipeView {
//        id: swipeView
//        anchors.fill: parent
//        currentIndex: tabBar.currentIndex

//        Page1 {
//        }

//        Page {
//            Label {
//                text: qsTr("Second page")
//                anchors.centerIn: parent
//            }
//        }
//    }

//    footer: TabBar {
//        id: tabBar
//        currentIndex: swipeView.currentIndex
//        TabButton {
//            text: qsTr("First")
//        }
//        TabButton {
//            text: qsTr("Second")
//        }
//    }
}
