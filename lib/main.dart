import 'package:flutter/material.dart';
import 'package:yogasan_rectifier/camera.dart';
import 'package:yogasan_rectifier/fil_picker_page.dart';
import 'package:camera/camera.dart';
import 'dart:async';

late List<CameraDescription> cameras;

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => FilePickerPage(),
                  ),
                ),
                child: Text('Pick an Image'),
                color: Colors.amber,
              ),
              MaterialButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CameraApp(cameras),
                  ),
                ),
                child: Text('Open Camera'),
                color: Colors.amber,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
