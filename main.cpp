#include <QApplication>
#include <QQmlApplicationEngine>
#include <qqml.h>

#include "TestMessagePackObject.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    qmlRegisterType<TestMessagePackObject>(
                "TestMessagePack",
                1,
                0,
                "TestMessagePackObject" );

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec( );
}

