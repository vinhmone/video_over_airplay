import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VideoOverAirplayWidget extends StatefulWidget {
  const VideoOverAirplayWidget({
    super.key,
    this.width,
    this.height,
    this.prioritizesVideoDevices = false,
    this.onShowPickerView,
    this.onClosePickerView,
    required this.child,
  });

  final double? width;
  final double? height;

  /// Whether or not the route picker should sort video capable output devices to the top of the list.
  /// Setting this to `true` will cause the route picker view to show a videocentric icon.
  final bool prioritizesVideoDevices;

  /// The route picker view will start presenting routes to the user.
  final VoidCallback? onShowPickerView;

  /// The route picker view will finished presenting routes to the user.
  final VoidCallback? onClosePickerView;

  final Widget child;

  @override
  State<VideoOverAirplayWidget> createState() => _VideoOverAirplayWidgetState();
}

class _VideoOverAirplayWidgetState extends State<VideoOverAirplayWidget> {
  MethodChannel? _methodChannel;

  @override
  void dispose() {
    _disposeChannel();
    super.dispose();
  }

  void _onPlatformViewCreated(int id) {
    final name = 'video_over_airplay#$id';

    if (_methodChannel?.name != name) {
      _disposeChannel();
    }

    _methodChannel = MethodChannel(name);
    _methodChannel!.setMethodCallHandler(_onPlatformCall);
  }

  Future<dynamic> _onPlatformCall(MethodCall call) async {
    switch (call.method) {
      case 'onShowPickerView':
        widget.onShowPickerView?.call();
        break;
      case 'onClosePickerView':
        widget.onClosePickerView?.call();
        break;
    }
  }

  void _disposeChannel() {
    _methodChannel?.setMethodCallHandler(null);
    _methodChannel = null;
  }

  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return Container(
        width: widget.width,
        height: widget.height,
        alignment: Alignment.center,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            widget.child,
            Positioned.fill(
              child: UiKitView(
                viewType: 'airplay_route_picker_view',
                creationParamsCodec: const StandardMessageCodec(),
                onPlatformViewCreated: _onPlatformViewCreated,
              ),
            ),
          ],
        ),
      );
    } else {
      return const Center(
        child: Text('This is an IOS feature!'),
      );
    }
  }
}
