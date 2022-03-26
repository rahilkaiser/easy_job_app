import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../components/custom_nav_bar.dart';
import '../../constants.dart';
import '../../enums.dart';
import 'components/filter_result_body.dart';
import 'components/filter_search_field.dart';

class FilterScreenResult extends StatefulWidget {
  static String routeName = "/filter_result";

  const FilterScreenResult({Key? key}) : super(key: key);

  @override
  State<FilterScreenResult> createState() => _FilterScreenResultState();
}

class _FilterScreenResultState extends State<FilterScreenResult> {
  TextEditingController contr = TextEditingController(text: "");

  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  bool showContr = false;
  String searchedValue = "";
  @override
  Widget build(BuildContext context) {
    searchedValue = "";

    if (ModalRoute.of(context)!.settings.arguments != null) {
      searchedValue = ModalRoute.of(context)!.settings.arguments as String;
    }

    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: double.infinity,
          height: 42,
          color: Colors.white,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              border: Border.all(
                color: kTextColor,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.search,
                  color: kPrimaryColor,
                ),
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(
                        left: 10,
                        right: 0,
                        top: 0,
                        bottom: 4,
                      ),
                    ),
                    onPressed: () async {
                      final result = await Navigator.pushNamed(
                          context, FilterSearchField.routeName);
                      if (result is String) {
                        setState(() {
                          showContr = true;
                          contr.text = result;
                        });
                      }
                    },
                    child: getTextValue(),
                  ),
                ),
                // GestureDetector(
                //   child: SvgPicture.asset(
                //     "assets/icons/filter.svg",
                //     color: kPrimaryColor,
                //   ),
                //   onTap: () {
                //     /* Clear the search field */
                //   },
                // ),
                // SizedBox(width: 12),
                GestureDetector(
                  child: Icon(
                    Icons.bookmark_add,
                    color: kPrimaryColor,
                    size: 32,
                  ),
                  onTap: () {
                    /* Clear the search field */
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      body: FilterResultBody(),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.SEARCH),
    );
  }

  Text getTextValue() {
    if ((showContr && contr.text.isEmpty) ||
        (!showContr && searchedValue.isEmpty)) {
      return Text(
        "Wonach suchen Sie?",
        style: TextStyle(color: Color(0XFF8B8B8B), fontSize: 17),
        textAlign: TextAlign.left,
      );
    }

    if (showContr && contr.text.isEmpty) {
      return Text(
        "Wonach suchen Sie?",
        style: TextStyle(color: Color(0XFF8B8B8B), fontSize: 17),
        textAlign: TextAlign.left,
      );
    }

    if (showContr) {
      return Text(
        contr.text,
        style: TextStyle(color: Colors.black, fontSize: 17),
        textAlign: TextAlign.left,
      );
    } else {
      return Text(
        searchedValue,
        style: TextStyle(color: Colors.black, fontSize: 17),
        textAlign: TextAlign.left,
      );
    }
  }
}

// ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   alignment: Alignment.centerLeft,
//                   padding: EdgeInsets.only(
//                     left: 10,
//                     right: 0,
//                     top: 0,
//                     bottom: 0,
//                   ),
//                 ),
//                 onPressed: () {},
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Container(
//                       color: Colors.amber,
//                       child: Text("Filter"),
//                     ),
//                     SizedBox(
//                       width: 5,
//                     ),
//                     Icon(
//                       Icons.add,
//                     )
//                   ],
//                 ),
//               )

// TextField(        "Wonach suchen Sie?",
//               controller: _textEditingController,
//               onTap: () {
//                 //Navigate to searchfilter
//                 FocusScope.of(context)
//                     .requestFocus(new FocusNode()); //remove focus
//                 WidgetsBinding.instance?.addPostFrameCallback(
//                     (_) => _textEditingController.clear());

//                 Navigator.pushNamed(context, FilterSearchField.routeName);
//               },
//               decoration: InputDecoration(
//                 contentPadding: EdgeInsets.symmetric(
//                   horizontal: getProportionateScreenWidth(20),
//                   vertical: getProportionateScreenWidth(9),
//                 ),
//                 focusColor: kPrimaryColor,
//                 prefixIcon: Icon(
//                   Icons.search,
//                   color: kPrimaryColor,
//                 ),
//                 suffixIcon: IconButton(
//                   icon: Icon(
//                     Icons.clear,
//                     color: kPrimaryColor,
//                   ),
//                   onPressed: () {
//                     /* Clear the search field */
//                   },
//                 ),
//                 hintText: 'Wonach suchen Sie',
//               ),
//             ),













//what is typed in -> normal font --- what letters for autocompletion in suggestion -> bold
// letzte Suchen
// Gespeicherte suchen



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

