import 'dart:math';

import 'package:easy_job_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/scheduler/ticker.dart';

import '../../../../constants.dart';

class ChatInputField extends StatefulWidget {
  ChatInputField({
    Key? key,
  }) : super(key: key);

  @override
  State<ChatInputField> createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  bool isTyping = false;

  Icon presentIcon = Icon(Icons.mic);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
    );

    animation = Tween(begin: 0.0, end: 2 * pi).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding / 2,
          vertical: kDefaultPadding / 2,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 32,
              color: Color(0xFF087949).withOpacity(0.08),
            ),
          ],
        ),
        child: SafeArea(
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: kDefaultPadding * 0.5,
                  ),
                  decoration: BoxDecoration(
                    color: kPrimaryColor.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.sentiment_satisfied_alt_outlined,
                        color: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .color!
                            .withOpacity(0.64),
                      ),
                      SizedBox(width: kDefaultPadding / 4),
                      Expanded(
                        child: TextField(
                          onChanged: (value) {
                            if (value.isEmpty &&
                                animation.status == AnimationStatus.completed) {
                              controller.reverse();
                              presentIcon = Icon(Icons.mic);

                              setState(() {
                                isTyping = false;
                              });
                            } else if (value.isNotEmpty &&
                                animation.status == AnimationStatus.dismissed) {
                              controller.forward();
                              presentIcon = Icon(Icons.send);

                              setState(() {
                                isTyping = true;
                              });
                            }
                          },
                          // style: TextStyle(fontSize: ),
                          decoration: InputDecoration(
                            hintText: "Nachricht",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.attach_file,
                        color: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .color!
                            .withOpacity(0.64),
                      ),
                      !isTyping
                          ? SizedBox(width: kDefaultPadding / 4)
                          : Container(),
                      !isTyping ? getFotoWidget(context) : Container(),
                    ],
                  ),
                ),
              ),
              SizedBox(width: kDefaultPadding / 4),
              Container(
                padding: EdgeInsets.all(kDefaultPadding * 0.5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: kPrimaryColor,
                ),
                child: AnimatedBuilder(
                  animation: animation,
                  builder: (context, child) {
                    return Transform.rotate(
                        angle: animation.value, child: presentIcon);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Icon getFotoWidget(BuildContext context) {
    return Icon(
      Icons.camera_alt_outlined,
      color: Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.64),
    );
  }
}
