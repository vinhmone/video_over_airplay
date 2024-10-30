import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'video_over_airplay_platform_interface.dart';

/// An implementation of [VideoOverAirplayPlatform] that uses method channels.
class MethodChannelVideoOverAirplay extends VideoOverAirplayPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('video_over_airplay');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
