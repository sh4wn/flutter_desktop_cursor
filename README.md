
## support resize cursors for flutter desktop on macOS.
- resizeUpLeftDownRight
- resizeUpRightDownLeft
- resizeUpLeft
- resizeUpRight
- resizeDownLeft
- resizeDownRight


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
