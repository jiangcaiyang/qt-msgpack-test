import QtQuick 2.3
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.2
import TestMessagePack 1.0

Window
{
    visible: true
    width: isMobileDevice( )? Screen.width: 270
    height: isMobileDevice( )? Screen.height: 480

    TestMessagePackObject
    {
        id: object
    }

    Column
    {
        id: cl
        spacing: 5

        anchors.fill: parent

        Label
        {
            text: "请输入base64码"
        }

        TextField
        {
            id: base64Input
            width: parent.width
            text: "g6NrZXmlR3JlYXSldmFsdWUMpWdyb3VwlAwjPw0="
            onAccepted: cl.unpackFromBase64( text )
        }

        Button
        {
            text: "解包"
            onClicked: cl.unpackFromBase64( base64Input.text )
        }

        function unpackFromBase64( base64Text )
        {
            var unpacked = object.unpackFromBase64( base64Text );
            outputLabel.text = JSON.stringify( unpacked );
        }

        Label
        {
            id: outputLabel
            text: "【输出】"
            width: parent.width
            height: 30
            wrapMode: Text.Wrap
        }

        Button
        {
            id: packButton
            text: "打包"
            onClicked:
            {
//                var testJson = "{\"group\":[12,35,63,13],\"key\":\"Great\",\"value\":12}";
//                var testJson =
//                {
//                    "key": "Great",
//                    "value": 12,
//                    "group": [12, 35, 63, 13]
//                };
                var testJson = "This is mine expected.";
                packedField.text = object.pack( testJson );
            }
        }

        TextField
        {
            id: packedField
            width: parent.width
            placeholderText: "打包后base64数据"
        }

        Row
        {
            Label
            {
                text: "原始字符串数据"
            }

            TextField
            {
                id: base64InputField
                width: 200
                placeholderText: "请输入原始字符串数据"
            }
        }

        Button
        {
            text: "仅base64编码"
            onClicked:
            {
                base64outputField.text = object.base64( base64InputField.text );
                base64PackOutputField.text = object.pack( base64InputField.text );
            }
        }

        TextField
        {
            id: base64outputField
            width: parent.width
            placeholderText: "输出的base64数据"
        }

        TextField
        {
            id: base64PackOutputField
            width: parent.width
            placeholderText: "输出的base64加上pack的数据"
        }
    }

    Component.onCompleted:
    {
        if ( !App.isMobileDevice( ) )
        {
            x = ( Screen.width - width ) / 2;
            y = ( Screen.height - height ) / 2;
        }
    }

    function isMobileDevice( )// 判断是否是移动平台
    {
        return  Qt.platform.os === "android" ||
                Qt.platform.os === "blackberry" ||
                Qt.platform.os === "ios" ||
                Qt.platform.os === "winphone";
    }
}

