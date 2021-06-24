import 'dart:async';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:yogasan_rectifier/first_page.dart';

late List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(
    MaterialApp(
      darkTheme: ThemeData(
        primaryColor: Colors.black,
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(
        cameras: cameras,
      ),
    ),
  );
}

class SplashScreen extends StatefulWidget {
  final cameras;
  SplashScreen({this.cameras});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 1),
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => MyApp(
              cameras: widget.cameras,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Image.asset(
            'assets/cartoon_yoga.png',
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  final cameras;
  MyApp({this.cameras});

  @override
  Widget build(BuildContext context) {
    return HomePage(
      cameras: cameras,
    );
  }
}

class HomePage extends StatefulWidget {
  final cameras;
  HomePage({this.cameras});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeScreen(
        cameras: widget.cameras,
      ),
    );
  }
}
