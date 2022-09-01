import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../constants.dart';
import '../../../../filter/filter_screen.dart';

class ElevatedFilterButton extends StatelessWidget {
  const ElevatedFilterButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: defaultPadding / 4, vertical: defaultPadding / 4),
      child: SizedBox(
        width: 48,
        height: 48,
        child: ElevatedButton(
          style: this.getButtonStyle(),
          onPressed: () {
            Navigator.pushNamed(context, FilterScreen.routeName,
                arguments: false);
          },
          child: SvgPicture.asset("assets/icons/filter.svg"),
        ),
      ),
    );
  }

  ButtonStyle getButtonStyle() {
    return ElevatedButton.styleFrom(
      primary: kPrimaryColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}