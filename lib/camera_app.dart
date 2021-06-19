import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';

class CameraApp extends StatefulWidget {
  final List<CameraDescription> cameras;
  CameraApp(this.cameras);
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

        _controller.startImageStream(
          (CameraImage img) {
            if (!isDetecting) {
              isDetecting = true;

              int startTime = new DateTime.now().millisecondsSinceEpoch;

              Tflite.runPoseNetOnFrame(
                bytesList: img.planes.map((plane) {
                  return plane.bytes;
                }).toList(),
                imageHeight: img.height,
                imageWidth: img.width,
                numResults: 1,
                rotation: -90,
                threshold: 0.1,
                nmsRadius: 10,
              ).then((value) {
                int endTime = new DateTime.now().millisecondsSinceEpoch;
                print("Detection took ${endTime - startTime}");
                recognitions = value;
                print('recognitions : $recognitions');

                int length = recognitions![0]['keypoints'].length;
                print('recognitions : ${recognitions[0]['keypoints'][0]}');
                print('\n single rows ..');
                for (int i = 0; i < length; i++) {
                  var path = recognitions[0]['keypoints'][i];
                  map[path['part']] = Vector(path['x'], path['y']);

                  if (path['part'] == 'leftEye') {
                    leftEye.x = path['x'] * 300;
                    leftEye.y = path['y'] * 500;
                  }
                  if (path['part'] == 'rightEye') {
                    rightEye.x = path['x'] * 300;
                    rightEye.y = path['y'] * 500;
                  }
                  if (path['part'] == 'leftShoulder') {
                    leftShoulder.x = path['x'] * 300;
                    leftShoulder.y = path['y'] * 500;
                  }
                  if (path['part'] == 'rightShoulder') {
                    rightShoulder.x = path['x'] * 300;
                    rightShoulder.y = path['y'] * 500;
                  }
                  if (path['part'] == 'leftElbow') {
                    leftElbow.x = path['x'] * 300;
                    leftElbow.y = path['y'] * 500;
                  }
                  if (path['part'] == 'rightElbow') {
                    rightElbow.x = path['x'] * 300;
                    rightElbow.y = path['y'] * 500;
                  }
                  if (path['part'] == 'leftWrist') {
                    leftWrist.x = path['x'] * 300;
                    leftWrist.y = path['y'] * 500;
                  }
                  if (path['part'] == 'rightWrist') {
                    rightWrist.x = path['x'] * 300;
                    rightWrist.y = path['y'] * 500;
                  }
                  if (path['part'] == 'leftHip') {
                    leftHip.x = path['x'] * 300;
                    leftHip.y = path['y'] * 500;
                  }
                  if (path['part'] == 'rightHip') {
                    rightHip.x = path['x'] * 300;
                    rightHip.y = path['y'] * 500;
                  }
                  if (path['part'] == 'leftKnee') {
                    leftKnee.x = path['x'] * 300;
                    leftKnee.y = path['y'] * 500;
                  }
                  if (path['part'] == 'rightKnee') {
                    rightKnee.x = path['x'] * 300;
                    rightKnee.y = path['y'] * 500;
                  }
                  if (path['part'] == 'leftAnkle') {
                    leftAnkle.x = path['x'] * 300;
                    leftAnkle.y = path['y'] * 500;
                  }
                  if (path['part'] == 'rightAnkle') {
                    rightAnkle.x = path['x'] * 300;
                    rightAnkle.y = path['y'] * 500;
                  }
                }
                print('nose : ${map['nose'].x}');
                setState(() {});
                for (var item in map.values) {
                  print(item.x);
                }

                isDetecting = false;
              });
            }
          },
        );
      },
    );
  }

  loadModel() async {
    var result = await Tflite.loadModel(
      model: 'assets/posenet.tflite',
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
    if (_controller == null || !_controller.value.isInitialized) {
      return Container();
    }
    return Container(
      child: Stack(
        children: [
          CameraPreview(_controller),
          for (var item in map.values)
            Positioned(
              left: item.x * 300,
              top: item.y * 500,
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
