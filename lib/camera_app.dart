import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';

class CameraApp extends StatefulWidget {
  final List<CameraDescription> cameras;
  final height;
  final width;
  final lable;
  CameraApp({required this.cameras, this.height, this.width, this.lable});
  @override
  _CameraAppState createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  late CameraController _controller;
  bool isDetecting = false;
  var recognitions;

  bool camera = true;

  double accuracy = 0.0;
  String lable = 'Pose not correct';

  double score = 0.0;
  

  @override
  void initState() {
    super.initState();
    loadModel();
    _controller = camera == true
        ? new CameraController(widget.cameras[1], ResolutionPreset.max)
        : new CameraController(widget.cameras[1], ResolutionPreset.max);
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

              Tflite.runModelOnFrame(
                bytesList: img.planes.map((plane) {
                  return plane.bytes;
                }).toList(),
                imageHeight: img.height,
                imageWidth: img.width,
                numResults: 1,
                rotation: -90,
                threshold: 0.1,
              ).then(
                (value) {
                  int endTime = new DateTime.now().millisecondsSinceEpoch;
                  print("Detection took ${endTime - startTime}");
                  recognitions = value;
                  print('recognitions : $recognitions');
                  try {
                    int length = recognitions.length;
                    if (length >= 0) {
                      score = recognitions[0]['confidence'];
                      lable = recognitions[0]['label'];
                      if ((lable == widget.lable) && ((score * 100) > 80.0)) {
                        print('the asana is $lable');
                        print('accuracy : $score');
                      }
                      print('label : $lable');
                    }
                    isDetecting = false;
                    setState(() {});
                  } catch (e) {
                    print('e : $e');
                    isDetecting = false;
                    setState(() {});
                  }
                },
              );
            }
          },
        );
      },
    );
  }

  loadModel() async {
    var result = await Tflite.loadModel(
      model: 'assets/model_unquant.tflite',
      labels: 'assets/labels.txt',
      useGpuDelegate: true,
      numThreads: 1,
      isAsset: true,
    );
    print('result : $result');
  }

  changeCamera() {
    camera = !camera;
    setState(() {});
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
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: changeCamera,
        child: IconButton(
          color: Colors.amber,
          onPressed: () {},
          icon: Icon(
            Icons.cameraswitch_rounded,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        height: height,
        width: width,
        child: Stack(
          children: [
            CameraPreview(_controller),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: width,
                height: 60,
                padding: EdgeInsets.all(
                  10,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Center(
                  child: lable == widget.lable
                      ? Text(
                          '$lable - ${score * 100}',
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 16,
                            color: Colors.amber,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : Text(
                          'Pose not correct',
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 16,
                            color: Colors.amber,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
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
