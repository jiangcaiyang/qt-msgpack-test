#include <QDebug>
#include <msgpack.h>
#include "TestMessagePackObject.h"

TestMessagePackObject::TestMessagePackObject( QObject* parent ):
    QObject( parent )
{
    MsgPack::setCompatibilityModeEnabled( true );
}

QByteArray TestMessagePackObject::pack( const QJsonObject& o )
{
    qDebug( "QJsonObject version called." );
    return MsgPack::pack( o.toVariantMap( ) ).toBase64( );
}

QByteArray TestMessagePackObject::pack( const QJsonArray& a )
{
    qDebug( "QJsonArray version called." );
    return MsgPack::pack( a.toVariantList( ) ).toBase64( );
}

QByteArray TestMessagePackObject::pack( const QVariant& v )
{
    qDebug( "QVariant version called." );
    return MsgPack::pack( v ).toBase64( );
}

QVariant TestMessagePackObject::unpack( const QByteArray& a )
{
    return MsgPack::unpack( a );
}

QVariant TestMessagePackObject::unpackFromBase64( const QByteArray& a )
{
    return MsgPack::unpack( QByteArray::fromBase64( a ) );
}

QByteArray TestMessagePackObject::base64( const QByteArray& a )
{
    return a.toBase64( );
}
