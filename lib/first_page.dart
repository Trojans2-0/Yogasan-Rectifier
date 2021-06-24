import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import 'gandhi_widget.dart';

class HomeScreen extends StatefulWidget {
  final cameras;
  HomeScreen({this.cameras});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
              alignment: Alignment(0, 0),
              child: Image.asset(
                'assets/cartoon_yoga.png',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 1,
              )),
          Positioned(
            bottom: 150,
            left: 60,
            child: Card(
              child: MaterialButton(
                color: Colors.white,
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                onPressed: () async {
                  await Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.bottomToTop,
                      duration: Duration(milliseconds: 10),
                      reverseDuration: Duration(milliseconds: 10),
                      child: GandhiTestWidget(
                        cameras: widget.cameras,
                      ),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      FontAwesomeIcons.google,
                      color: Color(0xFFE07B7B),
                      size: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text('Sign in with Google',
                          style: GoogleFonts.roboto(
                            color: Color(0xFFE07B7B),
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          )),
                    )
                  ],
                ),
              ),
              elevation: 4,
            ),
          ),
        ],
      ),
    );
  }
}
