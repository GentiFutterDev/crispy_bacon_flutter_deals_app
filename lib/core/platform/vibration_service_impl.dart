import 'package:crispy_bacon_flutter_deals_app/core/platform/vibration_service.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: VibrationService)
class VibrationServiceImpl implements VibrationService {
  static const _channel = MethodChannel('com.example.app/vibration');

  @override
  Future<void> customVibrate() async {
    try {
      await _channel.invokeMethod('customVibrate');
    } on PlatformException catch (e) {
      print("Error triggering vibration: ${e.message}");
    }
  }
}
