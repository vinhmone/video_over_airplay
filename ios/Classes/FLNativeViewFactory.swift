//
//  SharePlatformViewFactory.swift
//  video_over_airplay
//
//  Created by ChauBacHo on 30/10/2024.
//

import Foundation
import Flutter

class FLNativeViewFactory: NSObject, FlutterPlatformViewFactory {
    let _messenger : FlutterBinaryMessenger
    
    init(messenger: FlutterBinaryMessenger & NSObjectProtocol) {
        _messenger = messenger
    }
    
    func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
        var passedArgument: Dictionary<String, Any> = [:]
        if (args is Dictionary<String, Any>) {
            passedArgument = args as! Dictionary<String, Any>
        }
        return FlutterRoutePickerView(messenger: _messenger, viewId: viewId, arguments: passedArgument)
    }
    
    func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
        return FlutterStandardMessageCodec.sharedInstance()
    }
}
