import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:yogasan_rectifier/camera.dart';

class RedirectCamera extends StatefulWidget {
  final List<CameraDescription> cameras;
  RedirectCamera(this.cameras);
  @override
  _RedirectCameraState createState() => _RedirectCameraState();
}

class _RedirectCameraState extends State<RedirectCamera> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CameraApp(widget.cameras),
        ],
      ),
    );
  }
}
