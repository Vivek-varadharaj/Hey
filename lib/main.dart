import 'package:flutter/material.dart';
import 'package:hey/intro_screen.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(DateProposalApp());
}

class DateProposalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        fontFamily: 'Cursive', // Custom font for romantic feel
      ),
      home: IntroScreenTwo(),
    );
  }
}

class DateProposalScreen extends StatefulWidget {
  @override
  _DateProposalScreenState createState() => _DateProposalScreenState();
}

class _DateProposalScreenState extends State<DateProposalScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(125, 255, 17, 0),
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ScaleTransition(
                  //   scale: _animation,
                  //   child: Icon(
                  //     Icons.favorite,
                  //     size: 120,
                  //     color: Colors.red,
                  //   ),
                  // ),
                  // SizedBox(height: 20),
                  Text(
                    "May I kiss you right now????\nI will cherish these moments forever..",
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  // SizedBox(height: 40),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     ElevatedButton(
                  //       onPressed: () {
                  //         showDialog(
                  //           context: context,
                  //           builder: (BuildContext context) {
                  //             return AlertDialog(
                  //               title: Text('Yay! 💖'),
                  //               content: Text(
                  //                   'I can’t wait! I’ll plan something special!'),
                  //               actions: [
                  //                 TextButton(
                  //                   onPressed: () {
                  //                     Navigator.of(context).pop();
                  //                   },
                  //                   child: Text('Close'),
                  //                 ),
                  //               ],
                  //             );
                  //           },
                  //         );
                  //       },
                  //       style: ElevatedButton.styleFrom(
                  //         backgroundColor: Colors.white,
                  //         padding: EdgeInsets.symmetric(
                  //             horizontal: 32, vertical: 16),
                  //         shape: StadiumBorder(),
                  //       ),
                  //       child: Text(
                  //         'Yes 💕',
                  //         style: TextStyle(fontSize: 20, color: Colors.red),
                  //       ),
                  //     ),
                  //     SizedBox(width: 20),
                  //     ElevatedButton(
                  //       onPressed: () {
                  //         sendWhatsAppMessage("919747753976",
                  //             "Yeay.. Lets plan something!!!!!");
                  //       },
                  //       style: ElevatedButton.styleFrom(
                  //         backgroundColor: Colors.blueGrey,
                  //         padding: EdgeInsets.symmetric(
                  //             horizontal: 32, vertical: 16),
                  //         shape: StadiumBorder(),
                  //       ),
                  //       child: Text(
                  //         'No 💔',
                  //         style: TextStyle(fontSize: 20),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void sendWhatsAppMessage(String phoneNumber, String message) async {
    if (await canLaunch("https://wa.me/919747753976?text=Hello")) {
      await launch("https://wa.me/919747753976?text=Hello");
    } else {
      throw 'Could not launch';
    }
  }
}
