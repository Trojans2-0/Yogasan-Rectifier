import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yogasan_rectifier/camera_app.dart';
import 'package:yogasan_rectifier/redirect_camea.dart';
import 'package:yogasan_rectifier/second_page.dart';

class GandhiTestWidget extends StatefulWidget {
  final cameras;
  GandhiTestWidget({this.cameras});
  @override
  _GandhiTestWidgetState createState() => _GandhiTestWidgetState();
}

class _GandhiTestWidgetState extends State<GandhiTestWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  push(String s, height, width) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SecondPage(
          cameras: widget.cameras,
          title: s,
          height: height,
          width: width,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: ListView(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                    child: Text(
                      'Welcome User,',
                      style: GoogleFonts.montserrat(
                        color: Color(0xFFF6F4F9),
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: Align(
                    alignment: Alignment(0, 0),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(1200),
                        child: Image.asset(
                          'assets/gandhi.gif',
                          width: 250,
                          height: 300,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: GestureDetector(
                        onTap: () => push('Strengthen', height, width),
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: Color(0xFF4D6CFB),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: Alignment(-0.1, -0.5),
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 15, 0, 0),
                                        child: Text(
                                          'Strengthen',
                                          style: GoogleFonts.montserrat(
                                            color: Color(0xFF15212B),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Align(
                                  alignment: Alignment(1, 0),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 25, 0),
                                    child: Container(
                                      width: 60,
                                      height: 60,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            'https://media.giphy.com/media/XQEW2M51O9Mf2YA8Wr/source.gif',
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: GestureDetector(
                        onTap: () => push('Flexible', height, width),
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: Color(0xFF72BEFF),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: Alignment(-0.1, -0.5),
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 15, 0, 0),
                                        child: Text(
                                          'Flexible',
                                          textAlign: TextAlign.start,
                                          style: GoogleFonts.montserrat(
                                            color: Color(0xFF15212B),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Align(
                                  alignment: Alignment(1, 0),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 25, 0),
                                    child: Container(
                                      width: 60,
                                      height: 60,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.network(
                                        'https://media.giphy.com/media/XQEW2M51O9Mf2YA8Wr/source.gif',
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: GestureDetector(
                        onTap: () =>
                            push('Calm & Stress Relief', height, width),
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: Color(0xFF72BEFF),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: Alignment(-0.1, -0.5),
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 15, 0, 0),
                                        child: Text(
                                          'Calm & Stress Relief',
                                          style: GoogleFonts.montserrat(
                                            color: Color(0xFF15212B),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Align(
                                  alignment: Alignment(1, 0),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 25, 0),
                                    child: Container(
                                      width: 60,
                                      height: 60,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.network(
                                        'https://media.giphy.com/media/XQEW2M51O9Mf2YA8Wr/source.gif',
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: GestureDetector(
                        onTap: () =>
                            push('Calm & Stress Relief', height, width),
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: Color(0xFFFF7B43),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: Alignment(-0.1, -0.5),
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 15, 0, 0),
                                        child: Text(
                                          'Calm & Stress Relief',
                                          style: GoogleFonts.montserrat(
                                            color: Color(0xFF15212B),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Align(
                                  alignment: Alignment(1, 0),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 25, 0),
                                    child: Container(
                                      width: 60,
                                      height: 60,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.network(
                                        'https://media.giphy.com/media/XQEW2M51O9Mf2YA8Wr/source.gif',
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
