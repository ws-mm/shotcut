/*
 * Copyright (c) 2013-2014 Meltytech, LLC
 * Author: Dan Dennedy <dan@dennedy.org>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.2
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0

Rectangle {
    property alias ripple: rippleButton.checked
    property alias scrub: scrubButton.checked
    property alias snap: snapButton.checked

    SystemPalette { id: activePalette }

    width: 200
    height: 24
    color: activePalette.window

    Row {
        spacing: 6
        Item {
            width: 1
            height: 1
        }
        Button {
            action: menuAction
            implicitWidth: 28
            implicitHeight: 24
        }
        Button {
            action: appendAction
            implicitWidth: 28
            implicitHeight: 24
        }
        Button {
            action: deleteAction
            implicitWidth: 28
            implicitHeight: 24
        }
        Button {
            action: liftAction
            implicitWidth: 28
            implicitHeight: 24
        }
        Button {
            action: insertAction
            implicitWidth: 28
            implicitHeight: 24
        }
        Button {
            action: overwriteAction
            implicitWidth: 28
            implicitHeight: 24
        }
        CheckBox {
            id: scrubButton
            anchors.verticalCenter: parent.verticalCenter
            style: CheckBoxStyle {
                indicator: Rectangle {
                    implicitWidth: scrubText.width + 8
                    implicitHeight: 24
                    radius: 3
                    color: control.checked? activePalette.highlight : activePalette.button
                    border.color: activePalette.shadow
                    border.width: 1
                    Text {
                        id: scrubText
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        text: qsTr('Scrub Drag')
                        color: control.checked? activePalette.highlightedText : activePalette.windowText
                    }
                }
            }
        }
        CheckBox {
            id: rippleButton
            anchors.verticalCenter: parent.verticalCenter
            style: CheckBoxStyle {
                indicator: Rectangle {
                    implicitWidth: rippleText.width + 8
                    implicitHeight: 24
                    radius: 3
                    color: control.checked? activePalette.highlight : activePalette.button
                    border.color: activePalette.shadow
                    border.width: 1
                    Text {
                        id: rippleText
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        text: qsTr('Ripple Drop')
                        color: control.checked? activePalette.highlightedText : activePalette.windowText
                    }
                }
            }
        }
        CheckBox {
            id: snapButton
            checked: true
            anchors.verticalCenter: parent.verticalCenter
            style: CheckBoxStyle {
                indicator: Rectangle {
                    implicitWidth: snapText.width + 8
                    implicitHeight: 24
                    radius: 3
                    color: control.checked? activePalette.highlight : activePalette.button
                    border.color: activePalette.shadow
                    border.width: 1
                    Text {
                        id: snapText
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        text: qsTr('Snap')
                        color: control.checked? activePalette.highlightedText : activePalette.windowText
                    }
                }
            }
        }
    }

    Action {
        id: menuAction
        tooltip: qsTr('Display a menu of additional actions')
        iconName: 'format-justify-fill'
        iconSource: 'qrc:///icons/oxygen/16x16/actions/format-justify-fill.png'
        onTriggered: menu.popup()
    }

    Action {
        id: appendAction
        tooltip: qsTr('Append to the current track (C)')
        iconName: 'list-add'
        iconSource: 'qrc:///icons/oxygen/16x16/actions/list-add.png'
        onTriggered: timeline.append(currentTrack)
    }

    Action {
        id: deleteAction
        tooltip: qsTr('Ripple Delete - Remove current clip\nshifting following clips to the left (X)')
        iconName: 'go-previous'
        iconSource: 'qrc:///icons/oxygen/16x16/actions/go-previous.png'
        onTriggered: timeline.remove(currentClipTrack, currentClip)
    }

    Action {
        id: liftAction
        tooltip: qsTr('Lift - Remove current clip without\naffecting position of other clips (Z)')
        iconName: 'go-up'
        iconSource: 'qrc:///icons/oxygen/16x16/actions/go-up.png'
        onTriggered: timeline.lift(currentClipTrack, currentClip)
    }

    Action {
        id: insertAction
        tooltip: qsTr('Insert clip into the current track\nshifting following clips to the right (V)')
        iconName: 'go-next'
        iconSource: 'qrc:///icons/oxygen/16x16/actions/go-next.png'
        onTriggered: timeline.insert(currentTrack)
    }

    Action {
        id: overwriteAction
        tooltip: qsTr('Overwrite clip onto the current track (B)')
        iconName: 'go-down'
        iconSource: 'qrc:///icons/oxygen/16x16/actions/go-down.png'
        onTriggered: timeline.overwrite(currentTrack)
    }
}