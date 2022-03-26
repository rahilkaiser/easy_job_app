import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../constants.dart';

class WorkDateModal extends StatefulWidget {
  WorkDateModal({
    Key? key,
  }) : super(key: key);

  @override
  State<WorkDateModal> createState() => _WorkDateModalState();
}

class _WorkDateModalState extends State<WorkDateModal> {
  int? _selection = 0;

  bool fromDateSelected = false;
  bool untilDateSelected = false;
  DateTime fromDate = DateTime.now();
  late DateTime untilDate;

  @override
  void initState() {
    super.initState();

    untilDate = DateTime(fromDate.year + 10);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      contentPadding: EdgeInsets.all(10),
      title: const Text('Einsatzbeginn /-ende'),
      content: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Column(
          children: [
            Divider(
              thickness: 1,
            ),
            radioSelection(),
            Divider(
              thickness: 1,
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Flexible(
                  child: GestureDetector(
                    onTap: () async {
                      DateTime? newFromDate = await showDatePicker(
                        builder: (context, child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: ColorScheme.light(
                                primary: kPrimaryColor,
                              ),
                              textButtonTheme: TextButtonThemeData(
                                style: TextButton.styleFrom(
                                  primary: kPrimaryColor, // button text color
                                ),
                              ),
                            ),
                            child: child!,
                          );
                        },
                        locale: Locale("de"),
                        context: context,
                        initialDate: fromDate,
                        firstDate: DateTime.now(),
                        lastDate: untilDate,
                      );
                      if (newFromDate == null) return;

                      setState(() {
                        fromDateSelected = true;
                        fromDate = newFromDate;
                      });
                    },
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: kTextColor),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextField(
                            textAlign: TextAlign.center,
                            autofocus: true,
                            enabled: false,
                            decoration: InputDecoration(
                              label: Center(
                                child: getFromDateTextValue(),
                              ),
                              labelStyle: TextStyle(color: kPrimaryColor),
                            ),
                          ),
                        ),
                        Positioned(
                          top: -10,
                          left: 9,
                          child: Container(
                            color: Colors.white,
                            child: Text(
                              "Vom",
                              style: TextStyle(
                                fontSize: 12,
                                color: kPrimaryColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: GestureDetector(
                    onTap: () async {
                      DateTime? newUntilDate = await showDatePicker(
                        locale: Locale("de"),
                        context: context,
                        initialDate: fromDate,
                        firstDate: fromDate,
                        lastDate: DateTime(2300),
                        builder: (context, child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: ColorScheme.light(
                                primary: kPrimaryColor,
                              ),
                              textButtonTheme: TextButtonThemeData(
                                style: TextButton.styleFrom(
                                  primary: kPrimaryColor, // button text color
                                ),
                              ),
                            ),
                            child: child!,
                          );
                        },
                      );

                      if (newUntilDate == null) return;

                      setState(() {
                        untilDateSelected = true;
                        untilDate = newUntilDate;
                      });
                    },
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: kTextColor),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextField(
                            textAlign: TextAlign.center,
                            autofocus: true,
                            enabled: false,
                            decoration: InputDecoration(
                              label: Center(
                                child: getUntilDateTextValue(),
                              ),
                              labelStyle: TextStyle(color: kPrimaryColor),
                            ),
                          ),
                        ),
                        Positioned(
                          top: -10,
                          left: 9,
                          child: Container(
                            color: Colors.white,
                            child: Text(
                              "Bis",
                              style: TextStyle(
                                fontSize: 12,
                                color: kPrimaryColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
            primary: kPrimaryColor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Abbrechen'),
        ),
        TextButton(
          style: TextButton.styleFrom(
            primary: kPrimaryColor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('OK'),
        ),
      ],
    );
  }

  Widget getFromDateTextValue() {
    return fromDateSelected
        ? Text('${fromDate.day}.${fromDate.month}.${fromDate.year}')
        : Text("Beliebig");
  }

  Widget getUntilDateTextValue() {
    return untilDateSelected
        ? Text('${untilDate.day}.${untilDate.month}.${untilDate.year}')
        : Text("Beliebig");
  }

  Column radioSelection() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          contentPadding: EdgeInsets.all(0),
          title: const Text("Beliebig"),
          leading: Radio(
            activeColor: kPrimaryColor,
            value: 0,
            groupValue: _selection,
            onChanged: (int? value) {
              setState(() {
                _selection = value;
              });
            },
          ),
        ),
        ListTile(
          contentPadding: EdgeInsets.all(0),
          title: const Text("Ab sofort"),
          leading: Radio(
            activeColor: kPrimaryColor,
            value: 1,
            groupValue: _selection,
            onChanged: (int? value) {
              setState(() {
                _selection = value;
              });
            },
          ),
        ),
        ListTile(
          contentPadding: EdgeInsets.all(0),
          title: const Text("Ab nächste Woche"),
          leading: Radio(
            activeColor: kPrimaryColor,
            value: 2,
            groupValue: _selection,
            onChanged: (int? value) {
              setState(() {
                _selection = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
