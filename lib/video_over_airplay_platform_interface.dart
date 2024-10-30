import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'video_over_airplay_method_channel.dart';

abstract class VideoOverAirplayPlatform extends PlatformInterface {
  /// Constructs a VideoOverAirplayPlatform.
  VideoOverAirplayPlatform() : super(token: _token);

  static final Object _token = Object();

  static VideoOverAirplayPlatform _instance = MethodChannelVideoOverAirplay();

  /// The default instance of [VideoOverAirplayPlatform] to use.
  ///
  /// Defaults to [MethodChannelVideoOverAirplay].
  static VideoOverAirplayPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [VideoOverAirplayPlatform] when
  /// they register themselves.
  static set instance(VideoOverAirplayPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
