import 'package:easy_job_app/components/app_Bar.dart';
import 'package:easy_job_app/components/custom_nav_bar.dart';
import 'package:easy_job_app/enums.dart';
import 'package:flutter/material.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({Key? key}) : super(key: key);

  static String routeName = "/message";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: Text("KNDNL"),
      bottomNavigationBar: CustomBottomNavBar(
        selectedMenu: MenuState.MESSAGE,
      ),
    );
  }
}
