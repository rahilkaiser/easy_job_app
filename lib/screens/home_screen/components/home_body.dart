import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'home_header.dart';
import 'sections/categories_section.dart';
import 'sections/quick_selection_section.dart';
import 'sections/recommandations_section.dart';
import 'sections/special_jobs_section.dart';

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
            // const CustomBanner(),
            const CategoriesSection(),
            SizedBox(height: getProportionateScreenWidth(10)),
            const QuickSelectionSection(),
            //Best Paid and best rated jobs
            //Jobs close based on past jobs,interest & qualification & past-relevant-searches
            //Section search for all kind of Jobs close with FIlter
            const SpecialJobsSection(),
            SizedBox(height: getProportionateScreenWidth(30)),
            const RecommandationsSection(),
            SizedBox(height: getProportionateScreenWidth(30)),
            // SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}
