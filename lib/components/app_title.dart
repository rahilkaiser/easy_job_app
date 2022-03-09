import 'package:easy_job_app/constants.dart';
import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(children: [
        TextSpan(
          text: 'Easy',
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
        TextSpan(
          text: 'Job',
          style: TextStyle(
            color: kPrimaryColor,
            fontSize: 30,
            fontWeight: FontWeight.w700,
          ),
        ),
      ]),
    );
  }
}
