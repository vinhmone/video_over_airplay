import Flutter
import UIKit

public class VideoOverAirplayPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "video_over_airplay", binaryMessenger: registrar.messenger())
        let instance = VideoOverAirplayPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
        registrar.register(
            FLNativeViewFactory(messenger: registrar.messenger()),
            withId: "airplay_route_picker_view",
            gestureRecognizersBlockingPolicy: FlutterPlatformViewGestureRecognizersBlockingPolicy(rawValue: 0)
        )
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "getPlatformVersion":
            result("iOS " + UIDevice.current.systemVersion)
            //    case "onTap":
        default:
            result(FlutterMethodNotImplemented)
        }
    }
}
