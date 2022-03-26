import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:easy_job_app/constants.dart';
import 'package:easy_job_app/screens/home_screen/home_screen.dart';

import 'package:flutter/material.dart';

import '../../sign_in_screen/sign_in_screen.dart';

class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({Key? key}) : super(key: key);

  @override
  State<SplashScreenBody> createState() => _SplashScreenBodyState();
}

class _SplashScreenBodyState extends State<SplashScreenBody> {
  startTimer() async {
    var duration = const Duration(seconds: 1);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: kPrimaryColor,
            gradient: kPrimaryGradientColor,
          ),
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DefaultTextStyle(
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    RotateAnimatedText('Easy'),
                  ],
                ),
              ),
              DefaultTextStyle(
                style: const TextStyle(
                  color: kPrimaryLightColor,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    RotateAnimatedText('Job'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
