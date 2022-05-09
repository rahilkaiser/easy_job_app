import 'package:easy_job_app/screens/create_job/create_job_screen.dart';
import 'package:easy_job_app/screens/map/map_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../size_config.dart';

class QuickSelectionSection extends StatelessWidget {
  const QuickSelectionSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuickSelectCard(
              icon: "assets/icons/Location point.svg",
              press: () {
                Navigator.pushNamed(context, MapScreen.routeName);
              },
              text: "Suche Jobs in der Nähe"
              // "Search for Jobs close by",
              ),
          QuickSelectCard(
              icon: "assets/icons/Plus Icon.svg",
              press: () {
                Navigator.pushNamed(context, CreateJobScreen.routeName);
              },
              text: "Erstelle einen Auftrag"
              // "Create a job Offer",
              ),
        ],
      ),
    );
  }
}

class QuickSelectCard extends StatelessWidget {
  const QuickSelectCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String? icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFFECDF),
          borderRadius: BorderRadius.circular(10),
        ),
        width: getProportionateScreenWidth(120),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(20)),
              height: getProportionateScreenWidth(100),
              width: getProportionateScreenWidth(100),
              child: SvgPicture.asset(icon!),
            ),
            const SizedBox(height: 5),
            Text(text!, textAlign: TextAlign.center),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
