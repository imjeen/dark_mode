import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController _controller;
  late VoidCallback listener;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          AspectRatio(
            aspectRatio: 9 / 16,
            child: Container(
              child: (_controller != null
                  ? VideoPlayer(_controller)
                  : Container()),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    listener = () {
      setState(() {});
    };
    _controller = VideoPlayerController.asset("assets/video/splash.mp4")
      ..addListener(listener)
      ..setVolume(0.0)
      ..initialize()
      ..play();

    Timer(const Duration(seconds: 3), () {
      _controller.setVolume(0.0);
      _controller.removeListener(listener);
      Navigator.of(context).pushReplacementNamed('/fest');
    });
  }

  @override
  void deactivate() {
    if (_controller != null) {
      _controller.setVolume(0.0);
      _controller.removeListener(listener);
    }
    super.deactivate();
  }

  @override
  void dispose() {
    if (_controller != null) _controller.dispose();
    super.dispose();
  }
}
