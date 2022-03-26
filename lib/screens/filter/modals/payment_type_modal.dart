import 'package:flutter/material.dart';

import '../../../constants.dart';

class PaymentTypeModal extends StatefulWidget {
  const PaymentTypeModal({
    Key? key,
  }) : super(key: key);

  @override
  State<PaymentTypeModal> createState() => _PaymentTypeModalState();
}

class _PaymentTypeModalState extends State<PaymentTypeModal> {
  int? _selection = 0;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      contentPadding: EdgeInsets.all(10),
      title: const Text('Auftraggebertyp'),
      content: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Column(
          children: [
            Divider(
              thickness: 1,
            ),
            radioSelection(),
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
          title: const Text("Vollzeit"),
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
          title: const Text("Pauschal"),
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
