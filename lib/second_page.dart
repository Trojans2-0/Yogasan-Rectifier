import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:yogasan_rectifier/redirect_camea.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class SecondPage extends StatefulWidget {
  final title;
  final color;
  final cameras;
  final height;
  final width;
  SecondPage({this.title, this.color, this.cameras, this.height, this.width});
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  late YoutubePlayerController _controller;
  final pageViewController = PageController();

  String url = 'https://www.youtube.com/watch?v=_8kV4FHSdNA';

  runYoutubePlayer() {
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(url)!.toString(),
      flags: YoutubePlayerFlags(
        enableCaption: false,
        autoPlay: false,
        isLive: false,
      ),
    );
  }

  @override
  void initState() {
    runYoutubePlayer();
    super.initState();
  }

  push(String label) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => RedirectCamera(
          cameras: widget.cameras,
          height: widget.height,
          width: widget.width,
          label: label,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        width: MediaQuery.of(context).size.width - 10,
        controller: _controller,
      ),
      builder: (context, player) {
        return Scaffold(
          backgroundColor: Color(0xFF01020A),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: double.infinity,
                    height: 75,
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: widget.color,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                      ),
                      elevation: 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            '${widget.title}',
                            style: GoogleFonts.roboto(
                              color: Color(0xFF01020A),
                              fontWeight: FontWeight.w500,
                              fontSize: 25,
                            ),
                          ),
                          Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.network(
                              'https://media.giphy.com/media/XQEW2M51O9Mf2YA8Wr/source.gif',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  player,
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: Stack(
                      children: [
                        PageView(
                          controller: pageViewController,
                          scrollDirection: Axis.horizontal,
                          children: [
                            GestureDetector(
                              onTap: () => push('Adho Mukha Shvanasana'),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 40.0, vertical: 40.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFF7B43),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        height: 250,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.asset(
                                          'assets/adhoshavasana.png',
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: Text(
                                          'Adho Mukha Shvanasana',
                                          style: GoogleFonts.poppins(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => push('Utkata Konasana'),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 40.0, vertical: 40.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        height: 250,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.asset(
                                          'assets/utkata konasana.png',
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: Text(
                                          'Utkata Konasana',
                                          style: GoogleFonts.poppins(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => push('Kumbhakasana'),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 40.0, vertical: 40.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFF4D6CFB),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        height: 250,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.asset(
                                          'assets/Kumbhakasana.png',
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10.0),
                                        child: Text(
                                          'Kumbhakasana',
                                          style: GoogleFonts.poppins(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => push('Vrikshasana'),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 40.0, vertical: 40.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        height: 250,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.asset(
                                          'assets/vrikshanasana.png',
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10.0),
                                        child: Text(
                                          'Vrikshasana',
                                          style: GoogleFonts.poppins(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => push('Virabhadrasana'),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 40.0, vertical: 40.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFF3ed04b),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        height: 250,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.asset(
                                          'assets/virabhadhurasan.png',
                                        ),
                                      ),
                                      Text(
                                        'Virabhadrasana',
                                        style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment(0, 1.1),
                          child: SmoothPageIndicator(
                            controller: pageViewController,
                            count: 5,
                            axisDirection: Axis.horizontal,
                            onDotClicked: (i) {
                              pageViewController.animateToPage(
                                i,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            },
                            effect: ExpandingDotsEffect(
                              expansionFactor: 2,
                              spacing: 8,
                              radius: 16,
                              dotWidth: 16,
                              dotHeight: 16,
                              dotColor: Color(0xFF9E9E9E),
                              activeDotColor: Color(0xFF3F51B5),
                              paintStyle: PaintingStyle.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
