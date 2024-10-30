//
//  FlutterAVRoutePickerView.swift
//  video_over_airplay
//
//  Created by ChauBacHo on 30/10/2024.
//

import Foundation
import AVKit
import MediaPlayer
import Flutter

class FlutterRoutePickerView: NSObject, FlutterPlatformView {
    private var _flutterRoutePickerView: UIView;
    private var _delegate: AVRoutePickerViewDelegate?
    
    init(
        messenger: FlutterBinaryMessenger,
        viewId: Int64,
        arguments: Dictionary<String, Any>
    ) {
        //        let tempView = AVRoutePickerView(frame: CGRect(x: -100, y: -100, width: 1, height: 1))
        let tempView = AVRoutePickerView(frame: .zero)
        tempView.backgroundColor = .clear
        tempView.activeTintColor = .clear
        tempView.tintColor = .clear
        
        if #available(iOS 13.0, *) {
            let prioritizesVideoDevices = arguments["prioritizesVideoDevices"]
            if (prioritizesVideoDevices is Bool) {
                tempView.prioritizesVideoDevices = prioritizesVideoDevices as! Bool
            }
        }
        
        _delegate = FlutterAVRoutePickerDelegate(viewId: viewId, messenger: messenger)
        tempView.delegate = _delegate
        
        _flutterRoutePickerView = tempView
        
    }
    
    func view() -> UIView {
        return _flutterRoutePickerView
    }
    
    func showAirPlayPicker() {
        DispatchQueue.main.async {
            for subview in self._flutterRoutePickerView.subviews {
                if let button = subview as? UIButton {
                    button.sendActions(for: .touchUpInside)
                }
            }
        }
    }
}
