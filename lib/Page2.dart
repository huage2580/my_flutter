
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Page2 extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return Page2State();
  }
}

class Page2State extends State<Page2>{
  static const platform = const MethodChannel('samples.flutter.dev/battery');
  String _batteryLevel = 'Unknown battery level.';

  @override
  Widget build(BuildContext context) {
    _getBatteryLevel();
    return Scaffold(
      appBar: AppBar(title: Text("页面2"),),
      body: Container(
        child: Center(
          child: Text(_batteryLevel),
        ),
      ),
    );
  }

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      batteryLevel = await platform.invokeMethod('getBatteryLevel');
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

}