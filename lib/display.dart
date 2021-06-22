import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Display extends StatefulWidget {
  const Display({Key? key}) : super(key: key);

  @override
  _DisplayState createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  static const platform = const MethodChannel('android.flutter.dev/battery');
  String _battery = 'Not available yet';
  Future<void> _getbattery() async {
    String temp;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      temp = 'Battery level $result';
    } on PlatformException catch (e) {
      temp = 'Failed $e';
    }
    setState(() {
      _battery = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MaterialButton(
          onPressed: _getbattery,
          child: Text('Get Battery'),
          color: Colors.amber,
        ),
        Text(_battery),
      ],
    );
  }
}
