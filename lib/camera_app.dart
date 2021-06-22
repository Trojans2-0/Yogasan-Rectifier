import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';

class CameraApp extends StatefulWidget {
  final List<CameraDescription> cameras;
  final height;
  final width;
  CameraApp({required this.cameras, this.height, this.width});
  @override
  _CameraAppState createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  late CameraController _controller;
  bool isDetecting = false;
  var recognitions;

  Map map = Map();

  var nose = Vector(0, 0);
  var leftEye = Vector(0, 0);
  var rightEye = Vector(0, 0);
  var leftEar = Vector(0, 0);
  var rightEar = Vector(0, 0);
  var leftShoulder = Vector(0, 0);
  var rightShoulder = Vector(0, 0);
  var leftElbow = Vector(0, 0);
  var rightElbow = Vector(0, 0);
  var leftWrist = Vector(0, 0);
  var rightWrist = Vector(0, 0);
  var leftHip = Vector(0, 0);
  var rightHip = Vector(0, 0);
  var leftKnee = Vector(0, 0);
  var rightKnee = Vector(0, 0);
  var leftAnkle = Vector(0, 0);
  var rightAnkle = Vector(0, 0);

  @override
  void initState() {
    super.initState();
    loadModel();
    _controller = new CameraController(widget.cameras[0], ResolutionPreset.max);
    _controller.initialize().then(
      (_) {
        if (!mounted) {
          return;
        }
        setState(() => {});
        _controller.startImageStream((img) async {
          if (!isDetecting) {
            isDetecting = true;
          }
          var recognitions = await Tflite.runModelOnFrame(
              bytesList: img.planes.map((plane) {
                return plane.bytes;
              }).toList(),
              imageHeight: img.height,
              imageWidth: img.width,
              imageMean: 127.5,
              imageStd: 127.5,
              rotation: 90,
              numResults: 2,
              threshold: 0.1,
              asynch: true);
          print(recognitions);
        });
      },
    );
  }

  loadModel() async {
    Tflite.close();
    var result = await Tflite.loadModel(
      model: 'assets/mobilenet_v1_1.0_224.tflite',
      labels: 'assets/mobilenet.txt',
      isAsset: true,
      numThreads: 1,
    );
    print('result : $result');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    if (!_controller.value.isInitialized) {
      return Container();
    }
    return Container(
      height: height,
      width: width,
      child: Stack(
        children: [
          CameraPreview(_controller),
          for (var item in map.values)
            Positioned(
              left: item.x * width,
              top: item.y * height,
              child: Text(
                '* ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          CustomPaint(
            painter: MyPainter(left: leftShoulder, right: rightShoulder),
          ),
          CustomPaint(
            painter: MyPainter(left: leftElbow, right: leftShoulder),
          ),
          CustomPaint(
            painter: MyPainter(left: leftWrist, right: leftElbow),
          ),
          CustomPaint(
            painter: MyPainter(left: rightElbow, right: rightShoulder),
          ),
          CustomPaint(
            painter: MyPainter(left: rightWrist, right: rightElbow),
          ),
          CustomPaint(
            painter: MyPainter(left: leftShoulder, right: leftHip),
          ),
          CustomPaint(
            painter: MyPainter(left: leftHip, right: leftKnee),
          ),
          CustomPaint(
            painter: MyPainter(left: leftKnee, right: leftAnkle),
          ),
          CustomPaint(
            painter: MyPainter(left: rightShoulder, right: rightHip),
          ),
          CustomPaint(
            painter: MyPainter(left: rightHip, right: rightKnee),
          ),
          CustomPaint(
            painter: MyPainter(left: rightKnee, right: rightAnkle),
          ),
          CustomPaint(
            painter: MyPainter(left: leftHip, right: rightHip),
          ),
        ],
      ),
    );
  }
}

class Vector {
  double x, y;
  Vector(this.x, this.y);
}

class MyPainter extends CustomPainter {
  Vector left;
  Vector right;
  MyPainter({required this.left, required this.right});

  @override
  void paint(Canvas canvas, Size size) {
    final p1 = Offset(left.x, left.y);
    final p2 = Offset(right.x, right.y);
    final paint = Paint()
      ..color = Colors.amber
      ..strokeWidth = 4;
    canvas.drawLine(p1, p2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
