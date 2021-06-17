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
  late File file;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    filePick();
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
    var recognitions = await Tflite.runPoseNetOnImage(
      path: path,
      imageMean: 170.0,
      imageStd: 255.0,
    );
    print('recognitions : $recognitions');
  }

  filePick() async {
    FilePickerResult? _result = await FilePicker.platform.pickFiles();
    if (_result != null) {
      file = File(_result.files.single.path.toString());
      print(file);
      setState(() {});
      loadModel();
      runModel();
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Image.file(
            file,
            height: height / 1.60,
            width: width,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() async {
    // TODO: implement dispose
    super.dispose();
    await Tflite.close();
  }
}
