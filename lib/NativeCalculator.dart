// lib/native_calculator.dart
import 'package:flutter/services.dart';

class NativeCalculator {
  static const MethodChannel _channel = MethodChannel('native_calculator');

  Future<int> square(int number) async {
    final int result = await _channel.invokeMethod('abc', number);
    return result;
  }
}
