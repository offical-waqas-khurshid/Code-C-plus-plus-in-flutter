package com.example.ffi_demo
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel;

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "native_calculator")
                .setMethodCallHandler { call, result ->
                    if (call.method == "abc") {
                        val number = call.arguments as Int
                        val square = number * number
                        result.success(square)
                    } else {
                        result.notImplemented()
                    }
                }
    }
}
