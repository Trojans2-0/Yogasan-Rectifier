import 'package:flutter/material.dart';
// import 'package:yogasan_rectifier/fil_picker_page.dart';
import 'package:camera/camera.dart';
import 'package:yogasan_rectifier/first_page.dart';
import 'package:yogasan_rectifier/gandhi_widget.dart';
// import 'package:yogasan_rectifier/redirect_camea.dart';

late List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.dark, 
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: HomeScreen(),
    );
  }
}