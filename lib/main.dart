import 'package:flutter/material.dart';
import 'package:yogasan_rectifier/fil_picker_page.dart';
import 'package:camera/camera.dart';
import 'package:yogasan_rectifier/redirect_camea.dart';

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
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => FilePickerPage(),
                  ),
                ),
                child: Text('Pick an image'),
                color: Colors.amber,
              ),
              MaterialButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => RedirectCamera(
                      cameras: cameras,
                      height: height,
                      width: width,
                    ),
                  ),
                ),
                child: Text('Choose from Camera'),
                color: Colors.amber,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
