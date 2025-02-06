import 'package:flutter/material.dart';
import 'package:hey/intro_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:math';

import 'dart:math';
import 'package:flutter/material.dart';

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart'; // For Ticker

void main() {
  runApp(RoseDayApp());
}

class RoseDayApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Happy Rose Day!',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Georgia'),
      home: RoseDayScreen(),
    );
  }
}

class RoseDayScreen extends StatefulWidget {
  @override
  _RoseDayScreenState createState() => _RoseDayScreenState();
}

class _RoseDayScreenState extends State<RoseDayScreen>
    with SingleTickerProviderStateMixin {
  late final Ticker _ticker;
  Duration _globalElapsed = Duration.zero;
  final List<Rose> _roses = [];
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    // Start a ticker that updates the global elapsed time and calls setState every frame.
    _ticker = this.createTicker((elapsed) {
      setState(() {
        _globalElapsed = elapsed;
      });
    });
    _ticker.start();

    // Add new roses every 300ms.
    _scheduleNewRose();
  }

  void _scheduleNewRose() {
    Future.delayed(Duration(milliseconds: 300), () {
      if (mounted) {
        setState(() {
          // Always spawn the rose at the top (y = -50) using the current global elapsed time.
          double screenWidth = MediaQuery.of(context).size.width;
          _roses.add(Rose(
            screenWidth: screenWidth,
            spawnTime: _globalElapsed,
          ));
        });
        _scheduleNewRose();
      }
    });
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          // Animated background (optional)
          AnimatedContainer(
            duration: Duration(seconds: 3),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.pink.shade100, Colors.red.shade100],
              ),
            ),
          ),
          // Falling roses
          for (var rose in _roses)
            RoseWidget(
              rose: rose,
              globalElapsed: _globalElapsed,
              screenHeight: screenHeight,
            ),
          // Centered message
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Happy Rose Day, My Love! 🌹',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.red.shade900,
                    shadows: [
                      Shadow(
                        blurRadius: 10,
                        color: Colors.white,
                        offset: Offset(2, 2),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Chaaru, Every rose reminds me of your beauty and love.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.pink.shade800,
                    shadows: [
                      Shadow(
                        blurRadius: 5,
                        color: Colors.white,
                        offset: Offset(1, 1),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// A class that holds the properties for a falling rose.
class Rose {
  /// Horizontal position as a fraction of the screen width (0.0 to 1.0).
  double x;

  /// (Not used in calculation—always starts at the top.)
  double y;

  /// Initial rotation angle.
  double rotation;

  /// Falling speed in pixels per second.
  double speed;

  /// Horizontal drift factor.
  double drift;

  /// The time at which this rose started falling.
  Duration spawnTime;

  Rose({required double screenWidth, required this.spawnTime})
      : x = Random().nextDouble(),
        y = -50, // Always start at the top.
        rotation = Random().nextDouble() * 2 * pi,
        speed = 100 + Random().nextDouble() * 150,
        drift = (Random().nextDouble() - 0.5) * 2;

  /// Reset the rose to start falling again from the top.
  void reset(Duration currentTime) {
    x = Random().nextDouble();
    y = -50;
    rotation = Random().nextDouble() * 2 * pi;
    speed = 100 + Random().nextDouble() * 150;
    drift = (Random().nextDouble() - 0.5) * 2;
    spawnTime = currentTime;
  }
}

/// A widget that animates an individual rose.
class RoseWidget extends StatelessWidget {
  final Rose rose;
  final Duration globalElapsed;
  final double screenHeight;

  const RoseWidget({
    Key? key,
    required this.rose,
    required this.globalElapsed,
    required this.screenHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Calculate how many seconds have passed since this rose was spawned.
    final elapsedSeconds =
        (globalElapsed - rose.spawnTime).inMilliseconds / 1000.0;

    // Compute the new vertical position.
    double dy = rose.y + rose.speed * elapsedSeconds;

    // Compute a gentle horizontal drift.
    double screenWidth = MediaQuery.of(context).size.width;
    double dx = rose.x * screenWidth + sin(elapsedSeconds * rose.drift) * 20;

    // If the rose has fallen past the bottom of the screen, reset it.
    if (dy > screenHeight) {
      rose.reset(globalElapsed);
      // Recalculate elapsedSeconds after resetting.
      // (It will be nearly 0 so the rose starts from the top.)
      return const SizedBox.shrink();
    }

    return Positioned(
      left: dx,
      top: dy,
      child: Transform.rotate(
        angle: rose.rotation + elapsedSeconds,
        child: Opacity(
          opacity: 0.8,
          child: Image.asset(
            'assets/images/rose.png', // Ensure this asset is available.
            width: 40,
            height: 40,
          ),
        ),
      ),
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
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/image5.jpg"),
                  fit: BoxFit.cover)),
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
                      "Will you be my CHAARU and will you allow me to be your VIVI?",
                      style: TextStyle(
                        fontSize: 20,
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
