import 'package:flutter/material.dart';

import '../constants.dart';

class FloatingFoundResultButton extends StatelessWidget {
  const FloatingFoundResultButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: kPrimaryColor),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.search),
            SizedBox(
              width: 10,
            ),
            Text(
              "75.151 Treffer",
              style: TextStyle(
                fontSize: 17,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
