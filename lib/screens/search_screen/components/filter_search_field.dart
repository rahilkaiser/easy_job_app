import 'package:easy_job_app/screens/search_screen/filter_result_screen.dart';
import 'package:easy_job_app/theme.dart';
import 'package:flutter/material.dart';

class FilterSearchField extends StatefulWidget {
  static String routeName = "/filter_search";

  const FilterSearchField({Key? key}) : super(key: key);
  @override
  State<FilterSearchField> createState() => _FilterSearchFieldState();
}

class _FilterSearchFieldState extends State<FilterSearchField> {
  String savedValue = "";

  TextEditingController controller = TextEditingController(text: "");

  List<String> items = [
    "Apple",
    "Banana",
    "Oranges",
    "Melon",
  ];

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    bool pushedFromFilter =
        ModalRoute.of(context)!.settings.arguments == null ? true : false;

    return Theme(
      data: appBarThemeSearch(context),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              if (pushedFromFilter) {
                Navigator.pop(context, controller.text);
              } else {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  FilterScreenResult.routeName,
                  (Route<dynamic> route) => false,
                  arguments: controller.text,
                );
              }
            },
          ),
          title: TextField(
            autofocus: true,
            controller: controller,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.search,
            onSubmitted: (String _) {},
            decoration: InputDecoration(hintText: "Wonach suchen Sie"),
            onChanged: onSearchTextChanged,
          ),
          actions: [
            IconButton(
              onPressed: () {
                controller.clear();
              },
              icon: const Icon(Icons.clear),
            ),
          ],
        ),
        body: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return listTileGenerator(index);
                },
              ),
            )),
      ),
    );
  }

  Widget listTileGenerator(int index) {
    if (controller.text.isEmpty) {
      return ListTile(
        leading: Icon(Icons.search),
        title: Text(items[index]),
      );
    } else if (items[index].toLowerCase().contains(controller.text)) {
      return ListTile(
        leading: Icon(Icons.search),
        title: Text(items[index]),
      );
    } else {
      return Container();
    }
  }

  onSearchTextChanged(String text) async {
    setState(() {
      savedValue = controller.text;
    });
  }
}
