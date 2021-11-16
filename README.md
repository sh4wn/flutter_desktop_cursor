# flutter_desktop_cursor
support resizeUpLeftDownRight,resizeUpRightDownLeft,resizeUpLeft,resizeUpRight,resizeDownLeft,resizeDownRight for macOS.


## samples

```dart
    MouseRegion(
        cursor: FlutterDesktopCursors.resizeUpLeft,
        child: Container(
            width: 100,
            height: 100,
            child: const Center(child: Text('resizeUpLeft')),
        ),
    )
```