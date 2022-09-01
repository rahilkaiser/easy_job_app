import 'package:easy_job_app/components/app_Bar.dart';
import 'package:flutter/material.dart';

import '../../components/custom_nav_bar.dart';
import '../../enums.dart';
import 'components/home_body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";

  int currentNavBarIndex = 0;

  HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: HomeBody(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.HOME),
    );
  }
}
