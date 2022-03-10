import 'package:flutter/material.dart';

import '../../components/custom_nav_bar.dart';
import '../../enums.dart';
import 'components/home_body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";

  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeBody(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.HOME),
    );
  }
}
