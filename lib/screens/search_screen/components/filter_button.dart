import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FilterButton extends StatelessWidget {
  final String title;
  final bool removeAble;
  final bool useLeadingIcon;

  FilterButton({
    Key? key,
    required this.title,
    required this.removeAble,
    this.useLeadingIcon = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.black,
      ),
      onPressed: () {},
      child: Container(
        // height: 20,
        child: Row(
          children: [
            useLeadingIcon
                ? SvgPicture.asset(
                    "assets/icons/filter.svg",
                  )
                : Container(
                    height: 14,
                  ),
            SizedBox(width: 4),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            SizedBox(width: 4),
            Icon(
              removeAble
                  ? Icons.highlight_remove
                  : Icons.keyboard_arrow_down_outlined,
              size: 17,
              // Icons.arrow_drop_down,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );

    // TextButton(
    //   style: TextButton.styleFrom(
    //     alignment: Alignment.centerLeft,
    //     padding: EdgeInsets.all(5),
    //     backgroundColor: Colors.black87,
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(18),
    //     ),
    //   ),
    //   onPressed: () {},
    //   child: Container(
    //     height: 15,
    //     child: IntrinsicHeight(
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           useLeadingIcon
    //               ? Align(
    //                   child: SvgPicture.asset("assets/icons/filter.svg"),
    //                 )
    //               : Container(),
    //           Padding(
    //             padding: const EdgeInsets.symmetric(horizontal: 0),
    //             child: Align(
    //               alignment: Alignment.topCenter,
    //               child: Text(
    //                 title,
    //                 textAlign: TextAlign.start,
    //                 style: TextStyle(
    //                   color: Colors.white,
    //                   fontSize: 14,
    //                 ),
    //               ),
    //             ),
    //           ),
    //           Container(
    //             padding: EdgeInsets.only(
    //                 // top: removeAble ? 1 : 3,
    //                 ),
    //             child: Icon(
    //               removeAble
    //                   ? Icons.highlight_remove
    //                   : Icons.keyboard_arrow_down_outlined,
    //               color: Colors.white,
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
