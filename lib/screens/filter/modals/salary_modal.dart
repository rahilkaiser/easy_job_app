import 'package:easy_job_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SalaryModal extends StatefulWidget {
  SalaryModal({
    Key? key,
  }) : super(key: key);

  @override
  State<SalaryModal> createState() => _SalaryModalState();
}

class _SalaryModalState extends State<SalaryModal> {
  int? _selection = 0;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      contentPadding: EdgeInsets.all(10),
      title: const Text('Gehalt (€)'),
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
                  child: TextField(
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kPrimaryColor)),
                      // fillColor: kPrimaryColor,
                      labelText: "Von (€)",
                      labelStyle: TextStyle(color: kPrimaryColor),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: TextField(
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kPrimaryColor)),
                      // fillColor: kPrimaryColor,
                      labelText: "Bis (€)",
                      labelStyle: TextStyle(color: kPrimaryColor),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
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
          title: const Text("Ab 100 €"),
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
          title: const Text("Bis 450 €"),
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
        ListTile(
          contentPadding: EdgeInsets.all(0),
          title: const Text("Bis 1.000 €"),
          leading: Radio(
            activeColor: kPrimaryColor,
            value: 3,
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
          title: const Text("1.000 € - 3.000 €"),
          leading: Radio(
            activeColor: kPrimaryColor,
            value: 4,
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
