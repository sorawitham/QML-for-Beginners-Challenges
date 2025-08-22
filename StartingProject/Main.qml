import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Window {

    // TODO: change the size to ensure it forms the standard business card ratio of approx 1:1.586
    // HINT: you may wish to use a binding

    width: 571
    height: 360

    visible: true
    title: qsTr("Business Card")

    component ContactInfo: QtObject {

        // This is a ContactInfo object which provides the properties to fill in.
        // You can create as many instances of this as you like with different property values.

        // show these properties all the time:
        property string name
        property url photo

        // Basic Info properties:
        property string occupation
        property string company

        // Detailed Info properties:
        property string address
        property string country
        property string phone
        property string email
        property url webSite
    }

    component ToggleButton: Rectangle {
        property bool turnedOn: false

        signal toggled(bool turnedOn)

        width: 100
        height: 35
        border {
            width: 2
            color: "black"
        }
        radius: height / 2
        color: turnedOn? "white" : "black"
        Text {
            anchors.centerIn: parent
            font {
                pixelSize: 14
                bold: true
            }
            color: turnedOn? "black" : "white"
            text: turnedOn? "Basic Info" : "Details"
        }
        TapHandler {
            onTapped: {
                turnedOn = !turnedOn
                toggled(turnedOn)
            }
        }
    }

    component Name: Item {
        property alias line1Text: text1.text
        property alias line2Text: text2.text
        property alias line3Text: text3.text
        property alias line4Text: text4.text
        property alias line5Text: text5.text
        property alias line6Text: text6.text
        property alias line1Visible: text1.visible
        property alias line2Visible: text2.visible
        property alias line3Visible: text3.visible
        property alias line4Visible: text4.visible
        property alias line5Visible: text5.visible
        property alias line6Visible: text6.visible

        anchors {
            top: parent.top
            left: parent.left
        }

        Column {
            Text {
                id: text1

                text: "Text1"
                font {
                    pixelSize: 42
                    bold: true
                }
            }

            Column {
                Text {
                    id: text2

                    text: "Text2"
                    font {
                        pixelSize: 24
                    }
                }

                Text {
                    id: text3

                    text: "Text3"
                    font {
                        pixelSize: 24
                    }
                }

                Text {
                    id: text4

                    text: "Text4"
                    font {
                        pixelSize: 14
                    }
                }

                Text {
                    id: text5

                    text: "Text5"
                    font {
                        pixelSize: 14
                    }
                }

                Text {
                    id: text6

                    text: "Text6"
                    font {
                        pixelSize: 14
                    }
                }
            }
        }
    }

    component Picture: Rectangle {
        property alias imgSrc: img.source

        width: 200
        height: 200
        border {
            width: 2
            color: "black"
        }
        radius: 10

        Image {
            id: img

            anchors.fill: parent
            anchors.margins: 5
            fillMode: Image.PreserveAspectCrop
        }
    }

    ContactInfo {
        id: myContactInfo

        property bool showedBasic: true

        // this is one example instance of a ContactInfo inline Component
        // showing how the properties are populated.

        name: "Sorawit Ph"
        photo: Qt.resolvedUrl("IDPhoto.png")
        occupation: "Software Engineer"
        company: "IRD Laboratory Co., Ltd."
        address: "Bangkok"
        country: "Thailand"
        phone: "66 12 345 6789"
        email: "email@server.com"
        webSite: Qt.url("https://www.qt.io")
    }

    Rectangle {
        anchors {
            top: parent.top
            left: parent.left
        }
        width: 571
        height: 360
        border {
            width: 2
            color: "black"
        }
        radius: 10

        Name {
            anchors {
                top: parent.top
                left: parent.left
                margins: 20
            }

            line1Text: myContactInfo.name
            line2Text: myContactInfo.showedBasic? myContactInfo.occupation : myContactInfo.address
            line3Text: myContactInfo.showedBasic? myContactInfo.company : myContactInfo.country
            line4Text: myContactInfo.phone
            line5Text: myContactInfo.email
            line6Text: myContactInfo.webSite
            line4Visible: myContactInfo.showedBasic? false : true
            line5Visible: myContactInfo.showedBasic? false : true
            line6Visible: myContactInfo.showedBasic? false : true
        }

        ToggleButton {
            anchors {
                bottom: parent.bottom
                left: parent.left
                margins: 20
            }

            onToggled: (turnedOn) => {
                myContactInfo.showedBasic = !turnedOn
            }
        }

        Picture {
            anchors {
                top: parent.top
                right: parent.right
                margins: 20
            }

            imgSrc: myContactInfo.photo
        }
    }
}
