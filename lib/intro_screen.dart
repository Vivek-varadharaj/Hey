import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:hey/main.dart';
import 'package:stacked_card_carousel/stacked_card_carousel.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final String _text = """
Do you know what I really want right now?
Do you know am suppressing my urge to kiss you?
Do you know each time you board in my car I want to kiss you?
Yeah... I wanna kiss you chaaru... everytime I see you.. I really feel like kissing you... 
So am asking you....
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
      backgroundColor: Color.fromARGB(255, 136, 36, 48),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
I want you to know this is all I wanted... 
I want you to know am happy now... am at peace...
I want you to know I crave for your presence..
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
      backgroundColor: Color(0xff00246B),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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

class IntroScreenThree extends StatefulWidget {
  const IntroScreenThree({super.key});

  @override
  State<IntroScreenThree> createState() => _IntroScreenThreeState();
}

class _IntroScreenThreeState extends State<IntroScreenThree> {
  final String _text = """
I don't want you to overthing about future... 
I will become clingy may be... but thats because I want to be with you..
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
      backgroundColor: Color.fromARGB(255, 38, 99, 79),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
All I care is about us....
All I need is us... Being vivi and chaaru...
All I need is you being there with me.... 
All I need is those phone calls... texts... you calling me vivi... and ofcourse our great great phone sex....
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
      backgroundColor: Color(0xffB85042),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
