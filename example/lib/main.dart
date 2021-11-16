import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_desktop_cursor/flutter_desktop_cursor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = await FlutterDesktopCursor.platformVersion ??
          'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Wrap(
            runSpacing: 5,
            spacing: 5,
            children: [
              MouseRegion(
                cursor: FlutterDesktopCursors.resizeUpLeft,
                child: Container(
                  color: Colors.green,
                  width: 100,
                  height: 100,
                  child: const Center(child: Text('resizeUpLeft')),
                ),
              ),
              MouseRegion(
                cursor: FlutterDesktopCursors.resizeDownRight,
                child: Container(
                  color: Colors.green,
                  width: 100,
                  height: 100,
                  child: const Center(child: Text('resizeDownRight')),
                ),
              ),
              MouseRegion(
                cursor: FlutterDesktopCursors.resizeUpLeftDownRight,
                child: Container(
                  color: Colors.green,
                  width: 100,
                  height: 100,
                  child: const Center(child: Text('resizeUpLeftDownRight')),
                ),
              ),
              MouseRegion(
                cursor: FlutterDesktopCursors.resizeUpRightDownLeft,
                child: Container(
                  color: Colors.green,
                  width: 100,
                  height: 100,
                  child: const Center(child: Text('resizeUpRightDownLeft')),
                ),
              ),
              MouseRegion(
                cursor: FlutterDesktopCursors.resizeUpRight,
                child: Container(
                  color: Colors.green,
                  width: 100,
                  height: 100,
                  child: const Center(child: Text('resizeUpRight')),
                ),
              ),
              MouseRegion(
                cursor: FlutterDesktopCursors.resizeDownLeft,
                child: Container(
                  color: Colors.green,
                  width: 100,
                  height: 100,
                  child: const Center(child: Text('resizeDownLeft')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
