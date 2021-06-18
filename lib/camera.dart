import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraApp extends StatefulWidget {
  final List<CameraDescription> cameras;
  CameraApp(this.cameras);
  @override
  _CameraAppState createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  late CameraController _controller;
  XFile? imageFile;

  Future<XFile?> take() async{
    try {
      XFile file = await _controller.takePicture();
      return file;
    } on CameraException catch (e) {
      print(e);
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = new CameraController(widget.cameras[0], ResolutionPreset.max);
    _controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() => {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.value.isInitialized) {
      return new Container();
    }
    return Scaffold(
        body: Column(
        children: <Widget>[
         CameraPreview(_controller),
         Container(
           child: IconButton(
             iconSize: 50,
              icon: Icon(Icons.camera),
              onPressed: () {
               print(take());
              },
            )),
      ],
    ));
  }
}
