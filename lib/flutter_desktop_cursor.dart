import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class FlutterDesktopCursors {
  static MouseCursor get resizeUpLeftDownRight {
    return Platform.isMacOS
        ? const FlutterDesktopCursor._(kind: "resizeUpLeftDownRight")
        : SystemMouseCursors.resizeUpLeftDownRight;
  }

  static MouseCursor get resizeUpRightDownLeft {
    return Platform.isMacOS
        ? const FlutterDesktopCursor._(kind: "resizeUpRightDownLeft")
        : SystemMouseCursors.resizeUpRightDownLeft;
  }

  static MouseCursor get resizeUpLeft {
    return Platform.isMacOS
        ? const FlutterDesktopCursor._(kind: "resizeUpLeft")
        : SystemMouseCursors.resizeUpLeft;
  }

  static MouseCursor get resizeUpRight {
    return Platform.isMacOS
        ? const FlutterDesktopCursor._(kind: "resizeUpRight")
        : SystemMouseCursors.resizeUpRight;
  }

  static MouseCursor get resizeDownLeft {
    return Platform.isMacOS
        ? const FlutterDesktopCursor._(kind: "resizeDownLeft")
        : SystemMouseCursors.resizeDownLeft;
  }

  static MouseCursor get resizeDownRight {
    return Platform.isMacOS
        ? const FlutterDesktopCursor._(kind: "resizeDownRight")
        : SystemMouseCursors.resizeDownRight;
  }
}

class FlutterDesktopCursor extends MouseCursor {
  static const MethodChannel _channel = MethodChannel('flutter_desktop_cursor');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  const FlutterDesktopCursor._({
    required this.kind,
  });

  final String kind;

  @override
  MouseCursorSession createSession(int device) =>
      _FlutterDesktopCursorSession(this, device);

  @override
  String get debugDescription =>
      '${objectRuntimeType(this, 'FlutterDesktopCursor')}($kind)';
}

class _FlutterDesktopCursorSession extends MouseCursorSession {
  _FlutterDesktopCursorSession(FlutterDesktopCursor cursor, int device)
      : super(cursor, device);

  @override
  FlutterDesktopCursor get cursor => super.cursor as FlutterDesktopCursor;

  @override
  Future<void> activate() {
    return FlutterDesktopCursor._channel.invokeMethod<void>(
      'activateCursor',
      <String, dynamic>{
        'device': device,
        'kind': cursor.kind,
      },
    );
  }

  @override
  void dispose() {/* Nothing */}
}
