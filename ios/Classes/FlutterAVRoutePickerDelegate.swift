//
//  FlutterAVRoutePickerDelegate.swift
//  video_over_airplay
//
//  Created by ChauBacHo on 30/10/2024.
//

import Foundation
import AVKit
import Flutter

class FlutterAVRoutePickerDelegate : NSObject, AVRoutePickerViewDelegate {
    let _methodChannel: FlutterMethodChannel
    
    init(viewId: Int64, messenger: FlutterBinaryMessenger) {
        _methodChannel = FlutterMethodChannel(name: "video_over_airplay#\(viewId)", binaryMessenger: messenger)
    }
    
    func routePickerViewWillBeginPresentingRoutes(_ routePickerView: AVRoutePickerView) {
        _methodChannel.invokeMethod("onShowPickerView", arguments: nil)
    }
    
    func routePickerViewDidEndPresentingRoutes(_ routePickerView: AVRoutePickerView) {
        _methodChannel.invokeMethod("onClosePickerView", arguments: nil)
    }
}
