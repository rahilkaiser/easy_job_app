import 'package:easy_job_app/components/app_Bar.dart';
import 'package:flutter/material.dart';

import '../../components/custom_nav_bar.dart';
import '../../enums.dart';
import 'components/profile_body.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";

  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: ProfileBody(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.PROFILE),
    );
  }
}
