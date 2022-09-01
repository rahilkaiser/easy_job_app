import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'sections/search-field-section/HomeSearchField.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          HomeSearchField(),
          //Standort
          //Notifications
        ],
      ),
    );
  }
}
