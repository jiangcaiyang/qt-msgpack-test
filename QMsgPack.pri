# QMsgPack.pri

#QMSGPACK_PATH = /media/jiangcaiyang/我的软件盘/Develop/qmsgpack
QMSGPACK_PATH = E:/Develop/qmsgpack

# 注意修改源代码
# 在pack_p.cpp中，在include预编译指令最后，添加
#ifdef Q_OS_WINPHONE
#include <stdint.h>
#endif
# 这些预编译指令
#
# 并且将
#MsgPackPrivate::type_parser_f MsgPackPrivate::unpackers[32] = {
#    unpack_nil,
#    unpack_never_used,
#    unpack_false, unpack_true,
#    unpack_bin8, unpack_bin16, unpack_bin32,
#    unpack_ext8, unpack_ext16, unpack_ext32,
#    unpack_float32, unpack_float64,
#    unpack_uint8, unpack_uint16, unpack_uint32, unpack_uint64,
#    unpack_int8, unpack_int16, unpack_int32, unpack_int64,
#    unpack_fixext1, unpack_fixext2, unpack_fixext4, unpack_fixext8, unpack_fixext16,
#    unpack_str8, unpack_str16, unpack_str32,
#    unpack_array16, unpack_array32,
#    unpack_map16, unpack_map32
#};
#修改为
#MsgPackPrivate::type_parser_f MsgPackPrivate::unpackers[32] = {
#    MsgPackPrivate::unpack_nil,
#    MsgPackPrivate::unpack_never_used,
#    MsgPackPrivate::unpack_false,
#    MsgPackPrivate::unpack_true,
#    MsgPackPrivate::unpack_bin8,
#    MsgPackPrivate::unpack_bin16,
#    MsgPackPrivate::unpack_bin32,
#    MsgPackPrivate::unpack_ext8,
#    MsgPackPrivate::unpack_ext16,
#    MsgPackPrivate::unpack_ext32,
#    MsgPackPrivate::unpack_float32,
#    MsgPackPrivate::unpack_float64,
#    MsgPackPrivate::unpack_uint8,
#    MsgPackPrivate::unpack_uint16,
#    MsgPackPrivate::unpack_uint32,
#    MsgPackPrivate::unpack_uint64,
#    MsgPackPrivate::unpack_int8,
#    MsgPackPrivate::unpack_int16,
#    MsgPackPrivate::unpack_int32,
#    MsgPackPrivate::unpack_int64,
#    MsgPackPrivate::unpack_fixext1,
#    MsgPackPrivate::unpack_fixext2,
#    MsgPackPrivate::unpack_fixext4,
#    MsgPackPrivate::unpack_fixext8,
#    MsgPackPrivate::unpack_fixext16,
#    MsgPackPrivate::unpack_str8,
#    MsgPackPrivate::unpack_str16,
#    MsgPackPrivate::unpack_str32,
#    MsgPackPrivate::unpack_array16,
#    MsgPackPrivate::unpack_array32,
#    MsgPackPrivate::unpack_map16,
#    MsgPackPrivate::unpack_map32
#};

!exists( $$QMSGPACK_PATH ) {
    error( "QMsgPack.pri: The specified path does not exist." )
}

DEFINES += MSGPACK_MAKE_LIB
INCLUDEPATH += $$QMSGPACK_PATH/src

SOURCES +=  $$QMSGPACK_PATH/src/msgpack.cpp \
            $$QMSGPACK_PATH/src/msgpackcommon.cpp \
            $$QMSGPACK_PATH/src/private/pack_p.cpp \
            $$QMSGPACK_PATH/src/private/unpack_p.cpp \
            $$QMSGPACK_PATH/src/private/qt_types_p.cpp \
            $$QMSGPACK_PATH/src/msgpackstream.cpp

HEADERS +=  $$QMSGPACK_PATH/src/msgpack.h \
            $$QMSGPACK_PATH/src/private/pack_p.h \
            $$QMSGPACK_PATH/src/private/unpack_p.h \
            $$QMSGPACK_PATH/src/private/qt_types_p.h \
            $$QMSGPACK_PATH/src/endianhelper.h \
            $$QMSGPACK_PATH/src/msgpackcommon.h \
            $$QMSGPACK_PATH/src/msgpack_export.h \
            $$QMSGPACK_PATH/src/msgpackstream.h
