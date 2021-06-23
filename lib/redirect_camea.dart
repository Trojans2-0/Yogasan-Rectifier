import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:yogasan_rectifier/camera_app.dart';

class RedirectCamera extends StatefulWidget {
  final List<CameraDescription> cameras;
  final height;
  final width;
  final label;
  RedirectCamera({required this.cameras, this.height, this.width,this.label});
  @override
  _RedirectCameraState createState() => _RedirectCameraState();
}

class _RedirectCameraState extends State<RedirectCamera> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CameraApp(
          cameras: widget.cameras,
          height: widget.height,
          width: widget.width,
          lable: widget.label.toString(),
        ),
      ],
    );
  }
}
