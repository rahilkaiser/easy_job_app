// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:easy_job_app/components/app_Bar.dart';
import 'package:easy_job_app/components/app_title.dart';
import 'package:easy_job_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
