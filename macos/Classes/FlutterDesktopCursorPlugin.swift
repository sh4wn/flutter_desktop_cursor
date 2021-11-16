import Cocoa
import FlutterMacOS

public class FlutterDesktopCursorPlugin: NSObject, FlutterPlugin {

  private var hidden:Bool = false;
  private var cursorCaches:Dictionary = [String:NSCursor]();

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_desktop_cursor", binaryMessenger: registrar.messenger)
    let instance = FlutterDesktopCursorPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("macOS " + ProcessInfo.processInfo.operatingSystemVersionString)
    case "activateCursor":
      activeCursor(call.arguments as! Dictionary<String,Any>)
      result("ok")
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  private func activeCursor(_ arguments: Dictionary<String,Any>){
    let kind = arguments["kind"] as! String;
    if (kind == "none") {
      hide()
      return
    }

    let cursorObject = cursor(named:kind);
    displayCursorObject(cursorObject);
  }

  private func hide(){
    if(!hidden){
      NSCursor.hide()
    }
    hidden = true
  }

  private func displayCursorObject(_ cursor:NSCursor){
    cursor.set()
    if(hidden){
      NSCursor.unhide()
    }
    hidden = false
  }

  private func cursor(named name:String) -> NSCursor{
    var cursor = cursorCaches[name]
    if(cursor == nil){
      let image = image(named:"\(name).tiff")!;
      cursor = NSCursor.init(image:image,hotSpot:NSMakePoint(image.size.width / 2,image.size.height / 2))
      cursorCaches[name] = cursor
    }
    return cursor!
  }

  private func image(named:String) -> NSImage?{
    return NSImage.init(contentsOfFile:"\(Bundle.main.privateFrameworksPath!)/App.framework/Versions/A/Resources/flutter_assets/packages/flutter_desktop_cursor/images/\(named)");
  }
}
