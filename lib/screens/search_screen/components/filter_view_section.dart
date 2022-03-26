import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../filter_result_screen.dart';
import 'filter_button.dart';

class FilterViewSection extends StatelessWidget {
  const FilterViewSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = 0.0;

    return CustomScrollView(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      slivers: <Widget>[
        SliverAppBar(
          toolbarHeight: 42,
          // leading: FilterButton(
          //   title: "Filter",
          //   removeAble: false,
          // ),
          // collapsedHeight: 100,
          // expandedHeight: 33,
          expandedHeight: 100,
          pinned: true,
          floating: false,
          // leadingWidth: 20,
          // title:
          flexibleSpace: LayoutBuilder(
            builder: ((context, constraints) {
              width = constraints.biggest.width;

              return Flexible(
                child: (width < 100)
                    ? Container(
                        margin: EdgeInsets.only(right: 3),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.black,
                          ),
                          onPressed: () {
                            log("message");
                          },
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: SvgPicture.asset(
                              "assets/icons/filter.svg",
                            ),
                          ),
                        ),
                      )
                    : FilterButton(
                        title: "Filter",
                        removeAble: false,
                      ),
              );
            }),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  SizedBox(width: 4),
                  FilterButton(
                    title: "Deutschland",
                    removeAble: false,
                    useLeadingIcon: false,
                  ),
                  SizedBox(width: 4),
                  FilterButton(
                    title: "Gartenarbeit",
                    removeAble: true,
                    useLeadingIcon: false,
                  ),
                  SizedBox(width: 4),
                  FilterButton(
                    title: "Security",
                    removeAble: true,
                    useLeadingIcon: false,
                  ),
                  SizedBox(width: 4),
                  FilterButton(
                    title: "04.März.2022",
                    removeAble: true,
                    useLeadingIcon: false,
                  ),
                  SizedBox(width: 4),
                  FilterButton(
                    title: "450€",
                    removeAble: true,
                    useLeadingIcon: false,
                  ),
                  SizedBox(width: 4),
                  FilterButton(
                    title: "Vollzeit",
                    removeAble: true,
                    useLeadingIcon: false,
                  ),
                  SizedBox(width: 4),
                  FilterButton(
                    title: "ab sofort",
                    removeAble: true,
                    useLeadingIcon: false,
                  ),

                  //           // Scrollable horizontal widget here
                ]),
          ),
        ),
      ],
    );
  }
}
