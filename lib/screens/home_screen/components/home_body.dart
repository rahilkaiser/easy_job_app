import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'categories_section.dart';
import 'custom_banner.dart';
import 'home_header.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            const HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(10)),
            const CustomBanner(),
            const CategoriesSection(),
            // SpecialForYouSection(),
            // SizedBox(height: getProportionateScreenWidth(30)),
            // PopularJobsSection(),
            // SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}
