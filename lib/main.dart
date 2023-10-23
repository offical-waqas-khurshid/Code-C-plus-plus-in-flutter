// import 'dart:ffi' as ffi;
//
// typedef SystemC = ffi.Int32 Function(ffi.Int32, ffi.Int32);
// typedef SystemDart = int Function(int, int);
//
// void main() {
//   // change the path for other platforms (Mac, Windows)
//   const sharedLibPath = './lib/my_lib.c';
//   const addFuncName = 'add';
//   const powerFuncName = 'power';
//
//   final sharedLib = ffi.DynamicLibrary.open(sharedLibPath);
//
//   final add = sharedLib.lookupFunction<SystemC, SystemDart>(addFuncName);
//   final power = sharedLib.lookupFunction<SystemC, SystemDart>(powerFuncName);
//
//   int onePlusTow = add(1, 2);
//   int towPowerThree = power(2, 3);
//
//   print(onePlusTow);
//   print(towPowerThree);
// }






import 'package:ffi_demo/NativeCalculator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final NativeCalculator _calculator = NativeCalculator();
  int _result = 0;

  void _squareNumber(int number) async {
    final result = await _calculator.square(number);
    setState(() {
      _result = result;
    });
  }


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: InkWell(
              onTap: (){
                _squareNumber(12);
              },
              child: Text('Running on: $_result')),
        ),
      ),
    );
  }
 }