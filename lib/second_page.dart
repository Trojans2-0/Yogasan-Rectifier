import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: '_8kV4FHSdN',
    flags: YoutubePlayerFlags(
      isLive: true,
    ),
);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF01020A),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: double.infinity,
              height: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(120),
                  bottomRight: Radius.circular(120),
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                ),
              ),
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: Color(0xFF4D6CFB),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(120),
                    bottomRight: Radius.circular(120),
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 20, 20, 20),
                      child: Text(
                        'Strengthen',
                        style: GoogleFonts.roboto(
                          color: Color(0xFF01020A),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                      child: Container(
                        width: 120,
                        height: 120,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(
                          'https://media.giphy.com/media/XQEW2M51O9Mf2YA8Wr/source.gif',
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            YoutubePlayer(
              controller: _controller,
              liveUIColor: Colors.amber,
            ),
            Divider(),
            Divider(),
            Divider(),
            Divider(),
            Container(
              width: 350,
              height: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1),
              ),
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: Color(0xFF4D6CFB),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(1000),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                      child: Text(
                        'Adho Mukha Shvanasana',
                        style: GoogleFonts.roboto(
                          color: Color(0xFF01020A),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: 350,
              height: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1),
              ),
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: Color(0xFF4D6CFB),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(1000),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                      child: Text(
                        'Adho Mukha Shvanasana',
                        style: GoogleFonts.roboto(
                          color: Color(0xFF01020A),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: 350,
              height: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1),
              ),
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: Color(0xFF4D6CFB),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(1000),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                      child: Text(
                        'Adho Mukha Shvanasana',
                        style: GoogleFonts.roboto(
                          color: Color(0xFF01020A),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: 350,
              height: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1),
              ),
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: Color(0xFF4D6CFB),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(1000),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                      child: Text(
                        'Adho Mukha Shvanasana',
                        style: GoogleFonts.roboto(
                          color: Color(0xFF01020A),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: 350,
              height: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1),
              ),
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: Color(0xFF4D6CFB),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(1000),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                      child: Text(
                        'Adho Mukha Shvanasana',
                        style: GoogleFonts.roboto(
                          color: Color(0xFF01020A),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
