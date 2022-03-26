import 'package:flutter/material.dart';

import '../../home_screen/components/sections/recommandations_section.dart';
import 'filter_view_section.dart';

class FilterResultBody extends StatelessWidget {
  const FilterResultBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 17),
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 43,
            floating: true,
            pinned: true,
            snap: true,
            centerTitle: true,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: Container(),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: FilterViewSection(),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Container(
                padding: EdgeInsets.only(top: 20),
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return JobCard();
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                ),
              ),
              addAutomaticKeepAlives: false,
              childCount: 1,

              // Container(
              //   height: MediaQuery.of(context).size.height - 50,
              //   color: Colors.primaries[index % Colors.primaries.length],
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
