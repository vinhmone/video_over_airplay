
import 'video_over_airplay_platform_interface.dart';

class VideoOverAirplay {
  Future<String?> getPlatformVersion() {
    return VideoOverAirplayPlatform.instance.getPlatformVersion();
  }
}
