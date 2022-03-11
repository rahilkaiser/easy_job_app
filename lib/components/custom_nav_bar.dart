import 'package:easy_job_app/screens/search_screen/filter_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';
import '../enums.dart';
import '../screens/home_screen/home_screen.dart';
import '../screens/profile_screen/profile_screen.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    const Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //HOME
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/Shop Icon.svg",
                  color: MenuState.HOME == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () => {
                  if (selectedMenu != MenuState.HOME)
                    {
                      Navigator.pushReplacementNamed(
                          context, HomeScreen.routeName),
                    }
                },
              ),

              //SEARCH
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/Search Icon.svg",
                  color: MenuState.SEARCH == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () {
                  if (selectedMenu != MenuState.SEARCH) {
                    Navigator.pushReplacementNamed(
                        context, FilterScreen.routeName);
                  }
                },
              ),

              //CHAT
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/Chat bubble Icon.svg",
                  color: MenuState.MESSAGE == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () => {},
              ),

              //PROFIL
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/User Icon.svg",
                  color: MenuState.PROFILE == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () => {
                  if (selectedMenu != MenuState.PROFILE)
                    {
                      Navigator.pushReplacementNamed(
                          context, ProfileScreen.routeName),
                    }
                },
              ),
            ],
          )),
    );
  }
}
