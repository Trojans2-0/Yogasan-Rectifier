import 'package:flutter/material.dart';
import 'package:yogasan_rectifier/fil_picker_page.dart';

void main() => runApp(MyApp());

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
          child: MaterialButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => FilePickerPage(),
              ),
            ),
            child: Text('Pick an image'),
            color: Colors.amber,
          ),
        ),
      ),
    );
  }
}
