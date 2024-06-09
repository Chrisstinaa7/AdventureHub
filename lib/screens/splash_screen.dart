import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:adventurehub/screens/auth/loginscreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Timer _timer;
  int _animationIterations = 0;
  final int _totalAnimationDurationInSeconds = 5;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: _totalAnimationDurationInSeconds),
    )..repeat(reverse: true);

    _timer = Timer.periodic(Duration(seconds: _totalAnimationDurationInSeconds),
        (timer) {
      if (_animationIterations >= 1) {
        _navigateToRegister();
        timer.cancel();
      } else {
        _animationIterations++;
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  void _navigateToRegister() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.asset(
          'animations/starting.json',
          width: 200,
          height: 200,
          fit: BoxFit.cover,
          animate: true,
          controller: _controller,
        ),
      ),
    );
  }
}
