import 'package:flutter/services.dart';
import 'package:tflite/tflite.dart';
import 'package:flutter/material.dart';

class MobileNet extends StatefulWidget {
  const MobileNet({Key? key}) : super(key: key);

  @override
  _MobileNetState createState() => _MobileNetState();
}

class _MobileNetState extends State<MobileNet> {
  Future loadmodel() async {
    try {
      String? res = await Tflite.loadModel(
          model: "assets/mobilenet_v1_1.0_224.tflite",
          labels: "assets/mobilenet.txt",
          numThreads: 1,
          isAsset: true,
          useGpuDelegate: false);
      print(res);
    } on PlatformException {
      print("Failed");
    }
  }

  @override
  void initState() {
    super.initState();
    loadmodel();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
