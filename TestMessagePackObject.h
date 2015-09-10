#ifndef TESTMESSAGEPACKOBJECT_H
#define TESTMESSAGEPACKOBJECT_H

#include <QObject>
#include <QVariant>
#include <QJsonObject>
#include <QJsonArray>

class TestMessagePackObject: public QObject
{
    Q_OBJECT
public:
    explicit TestMessagePackObject( QObject* parent = Q_NULLPTR );
    Q_INVOKABLE QByteArray pack( const QJsonObject& o );
    Q_INVOKABLE QByteArray pack( const QJsonArray& a );
    Q_INVOKABLE QByteArray pack( const QVariant& v );
    Q_INVOKABLE QVariant unpack( const QByteArray& a );
    Q_INVOKABLE QVariant unpackFromBase64( const QByteArray& a );
    Q_INVOKABLE QByteArray base64( const QByteArray& a );
signals:
public slots:
};

#endif // TESTMESSAGEPACKOBJECT_H
