import 'package:flutter/material.dart';

import '../constants.dart';
import 'app_title.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.menu,
          // SvgPicture.asset("assets/icons/remove.svg"),
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [SizedBox(width: defaultPadding / 2), AppTitle()],
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.notifications_outlined,
          ),
          // SvgPicture.asset("assets/icons/Bell.svg"),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
