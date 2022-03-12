import 'package:easy_job_app/components/app_Bar.dart';
import 'package:easy_job_app/components/custom_nav_bar.dart';
import 'package:easy_job_app/enums.dart';
import 'package:easy_job_app/screens/home_screen/components/sections/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants.dart';

class FilterScreen extends StatelessWidget {
  FilterScreen({Key? key}) : super(key: key);

  static String routeName = "/filter";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.SEARCH),
    );
  }
}

// AppBar(
//         title: const Text("Search"),
//         actions: [
//           Expanded(
//             child: Container(
//               color: Colors.grey,
//               // padding: const EdgeInsets.symmetric(horizontal: 3),
//               child: TextField(
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(borderRadius: BorderRadius.zero),
//                   suffixIcon: Padding(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: defaultPadding / 3,
//                         vertical: defaultPadding / 3),
//                     child: SizedBox(
//                       width: 48,
//                       height: 48,
//                       child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           primary: kPrimaryColor,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.all(Radius.circular(12)),
//                           ),
//                         ),
//                         onPressed: () {
//                           // TODO: FILTER SEARCH
//                         },
//                         child: SvgPicture.asset("assets/icons/filter.svg"),
//                       ),
//                     ),
//                   ),
//                 ),
//                 onTap: () {
//                   showSearch(
//                     context: context,
//                     delegate: CustomSearchDelegate(),
//                   );
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerm = [
    "Apple",
    "Banana",
    "Oranges",
    "Melon",
  ];

  @override
  String get searchFieldLabel => 'Wonach suchst du?';

  @override
  TextStyle get searchFieldStyle => hintSearchTextStyle;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerm) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerm) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (
        context,
        index,
      ) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}
