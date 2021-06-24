import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';

class FilePickerPage extends StatefulWidget {
  const FilePickerPage({Key? key}) : super(key: key);

  @override
  _FilePickerPageState createState() => _FilePickerPageState();
}

class _FilePickerPageState extends State<FilePickerPage> {
  File? file;
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
    filePick();
    loadModel();
    runModel();
  }

  loadModel() async {
    var result = await Tflite.loadModel(
      model: 'assets/posenet.tflite',
      isAsset: true,
      numThreads: 1,
    );
    print('result : $result');
  }

  runModel() async {
    String path =
        '/data/user/0/com.example.yogasan_rectifier/cache/file_picker/like-my-style-casual-and-comfortable-picture-id610678206';
    String path1 =
        '/data/user/0/com.example.yogasan_rectifier/cache/file_picker/young-man-standing-full-length-portrait-white-background-141971362~2.jpg';
    String path2 =
        '/data/user/0/com.example.yogasan_rectifier/cache/file_picker/young-man-standing-full-length-portrait-white-background-141971362.jpg';
    var recognitions = await Tflite.runPoseNetOnImage(
      path: path,
    );
    print(path1);
    print(path2);
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
  }

  filePick() async {
    FilePickerResult? _result = await FilePicker.platform.pickFiles();
    if (_result != null) {
      file = File(_result.files.single.path.toString());
      print(file);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              file != null
                  ? Image.file(
                      file!,
                      height: 500,
                      width: 300,
                      fit: BoxFit.cover,
                    )
                  : Container(),
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
        ),
      ),
    );
  }

  @override
  void dispose() async {
    super.dispose();
    await Tflite.close();
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
