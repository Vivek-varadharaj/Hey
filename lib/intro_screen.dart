import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:hey/main.dart';
import 'package:stacked_card_carousel/stacked_card_carousel.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final String _text = """
I really wanna ask you one thing Chaaru... And I want you to be in this way... 
Thats why I didnt ask this in the chat... 
Can we be Vivi and Chaaru... Without any forced limitations.. 
Why cant we have such a phase again penne... Let it last for whatever days it lasts... 
Can we please give it a try????
""";
  String _displayedText = "";
  int _currentIndex = 0;
  late Timer _timer;
  final int _charDisplayDuration = 50; // Adjust this value to control speed
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startTyping();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 136, 36, 48),
      body: Container(
        padding: const EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/image3.jpg"),
                fit: BoxFit.cover)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hey Chaaru",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: Colors.white),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              _displayedText,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            if (_displayedText.length == _text.length)
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: IconButton(
                        color: const Color(0xff990011),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Color.fromARGB(255, 136, 36, 48),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: IconButton(
                        color: Color.fromARGB(255, 136, 36, 48),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DateProposalScreen(),
                          ));
                        },
                        icon: Icon(
                          Icons.arrow_forward,
                          color: Color(0xff990011),
                        ),
                      ),
                    ),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }

  void _startTyping() {
    _timer = Timer.periodic(Duration(milliseconds: _charDisplayDuration),
        (Timer timer) async {
      if (_currentIndex < _text.length) {
        setState(() {
          _displayedText += _text[_currentIndex];
          _currentIndex++;
        });
        // _playTypingSound(); // Play sound for each character
      } else {
        _timer.cancel();
        // await Future.delayed(Duration(seconds: 15));
        // Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) => IntroScreenTwo(),
        // ));
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer.cancel();
  }

  // Future<void> _playTypingSound() async {
  //   await _audioPlayer.play(AssetSource('sounds/typing.mp3'), volume: 0.5);
  // }
}

class IntroScreenTwo extends StatefulWidget {
  const IntroScreenTwo({super.key});

  @override
  State<IntroScreenTwo> createState() => _IntroScreenTwoState();
}

class _IntroScreenTwoState extends State<IntroScreenTwo> {
  final String _text = """
I am sorry for always being in madly love with you... 
I know it creates concerns for you...
I feel really good when we are together....
""";
  String _displayedText = "";
  int _currentIndex = 0;
  late Timer _timer;
  final int _charDisplayDuration = 50; // Adjust this value to control speed
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startTyping();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xff00246B),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/images/image1.jpg",
                ),
                fit: BoxFit.cover)),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hey Chaaru,",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: Colors.white),
            ),
            SizedBox(
              height: 16,
            ),
            AnimatedCrossFade(
              duration: Duration(milliseconds: 500),
              crossFadeState: _currentIndex == 0
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              secondChild: SizedBox(),
              firstChild: Text(
                _text,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: IconButton(
                      color: const Color(0xff990011),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => IntroScreenThree(),
                        ));
                      },
                      icon: Icon(
                        Icons.arrow_forward,
                        color: Color(0xff00246B),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _startTyping() async {
    await Future.delayed(Duration(milliseconds: 200));
    setState(() {
      _currentIndex = 1;
    });
  }

  // Future<void> _playTypingSound() async {
  //   await _audioPlayer.play(AssetSource('sounds/typing.mp3'), volume: 0.5);
  // }
}

class IntroScreenThree extends StatefulWidget {
  const IntroScreenThree({super.key});

  @override
  State<IntroScreenThree> createState() => _IntroScreenThreeState();
}

class _IntroScreenThreeState extends State<IntroScreenThree> {
  final String _text = """
Am having chills in stomach when am writing this Chaaru penne... 
I have said I love you to you a lof of times... I meant it every damn time...
But this time it hits different....
I really really loves you sooo sooo much.... 
""";
  String _displayedText = "";
  int _currentIndex = 0;
  late Timer _timer;
  final int _charDisplayDuration = 50; // Adjust this value to control speed
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startTyping();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/image2.jpg"),
                fit: BoxFit.cover)),
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Hey Chaaru,",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    color: Color(0xffE7E8D1)),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                _displayedText,
                style: TextStyle(fontSize: 20, color: Color(0xffE7E8D1)),
              ),
              if (_displayedText.length == _text.length)
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xffE7E8D1), shape: BoxShape.circle),
                        child: IconButton(
                          color: Color.fromARGB(255, 38, 99, 79),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: Color.fromARGB(255, 38, 99, 79),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xffE7E8D1), shape: BoxShape.circle),
                        child: IconButton(
                          color: Color.fromARGB(255, 38, 99, 79),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => IntroScreenFour(),
                            ));
                          },
                          icon: Icon(
                            Icons.arrow_forward,
                            color: Color.fromARGB(255, 38, 99, 79),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }

  void _startTyping() {
    _timer = Timer.periodic(Duration(milliseconds: _charDisplayDuration),
        (Timer timer) {
      if (_currentIndex < _text.length) {
        setState(() {
          _displayedText += _text[_currentIndex];
          _currentIndex++;
        });
        // _playTypingSound(); // Play sound for each character
      } else {
        _timer.cancel();
      }
    });
  }

  // Future<void> _playTypingSound() async {
  //   await _audioPlayer.play(AssetSource('sounds/typing.mp3'), volume: 0.5);
  // }
}

class IntroScreenFour extends StatefulWidget {
  const IntroScreenFour({super.key});

  @override
  State<IntroScreenFour> createState() => _IntroScreenFourState();
}

class _IntroScreenFourState extends State<IntroScreenFour> {
  final String _text = """
I know you loves me too....
I know you dont want me to go with other girls... Then why we should allow that to happen...
I really like it when you say am yours.... 
I know what am doing penne.. I really wanna prioritise you... 
""";
  String _displayedText = "";
  int _currentIndex = 0;
  late Timer _timer;
  final int _charDisplayDuration = 50; // Adjust this value to control speed
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startTyping();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xffB85042),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/image4.jpg"),
                fit: BoxFit.cover)),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hey Chaaru,",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: Color(0xffE7E8D1)),
            ),
            SizedBox(
              height: 16,
            ),
            AnimatedCrossFade(
              duration: Duration(milliseconds: 500),
              crossFadeState: _currentIndex == 0
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              secondChild: SizedBox(),
              firstChild: Text(
                _text,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xffE7E8D1), shape: BoxShape.circle),
                    child: IconButton(
                      color: const Color(0xff990011),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Color(0xffB85042),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xffE7E8D1), shape: BoxShape.circle),
                    child: IconButton(
                      color: const Color(0xffB85042),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => IntroScreen(),
                        ));
                      },
                      icon: Icon(
                        Icons.arrow_forward,
                        color: Color(0xffB85042),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _startTyping() async {
    await Future.delayed(Duration(milliseconds: 200));
    setState(() {
      _currentIndex = 1;
    });
  }

  // Future<void> _playTypingSound() async {
  //   await _audioPlayer.play(AssetSource('sounds/typing.mp3'), volume: 0.5);
  // }
}
