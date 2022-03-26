import 'package:easy_job_app/screens/filter/filter_screen.dart';
import 'package:easy_job_app/screens/search_screen/filter_result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';
import '../../../search_screen/components/filter_search_field.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  static const OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(12)),
    borderSide: BorderSide.none,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 39,
      decoration: BoxDecoration(
        color: kSecondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        onTap: () {
          Navigator.pushNamed(context, FilterSearchField.routeName,
              arguments: false);
        },
        enabled: true,
        // ignore: avoid_print
        onChanged: (value) => print(value),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: getProportionateScreenWidth(9),
          ),
          border: outlineInputBorder,
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          errorBorder: outlineInputBorder,
          hintText: "Welchen Job suchen Sie?",
          hintStyle: hintSearchTextStyle,
          prefixIcon: const Padding(
            padding: EdgeInsets.all(14),
            child: Icon(Icons.search),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding / 4, vertical: defaultPadding / 4),
            child: SizedBox(
              width: 48,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: kPrimaryColor,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, FilterScreen.routeName,
                      arguments: false);
                },
                child: SvgPicture.asset("assets/icons/filter.svg"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
