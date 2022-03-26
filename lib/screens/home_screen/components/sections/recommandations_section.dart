import 'package:easy_job_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants.dart';

class RecommandationsSection extends StatelessWidget {
  const RecommandationsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
        vertical: getProportionateScreenHeight(5),
      ),
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return JobCard();
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}

class JobCard extends StatelessWidget {
  const JobCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      const Color(0xFF7520).withOpacity(1),
                      Color.fromARGB(255, 248, 217, 197).withOpacity(1),
                    ],
                  ),
                ),
                child: Container(
                  // color: Colors.black,
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: "350€",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: "12 € pro Stunde",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      RichText(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        text: TextSpan(
                          text: "Sicherheitskraft immer Dienstags/Nachtschicht",
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: getProportionateScreenWidth(1) - 10,
                top: -10,
                child: Avatar(),
              )
            ],
          ),
          Container(
            // color: Colors.amber,
            padding: EdgeInsets.all(
              getProportionateScreenWidth(10),
            ),
            child: Column(
              children: [
                RichText(
                  maxLines: 3,
                  text: TextSpan(
                      style: TextStyle(
                        color: kTextColor,
                        fontSize: 12,
                      ),
                      text:
                          "Eine Beschreibung ist eine vorwiegend informierende, sachbetonte und wirklichkeitsnahe Darstellungsform. Die Beschreibung ist in genauer, eindeutiger und übersichtlicher sprachlicher Form abzufassen. Das Tempus ist der Präsens. Die Verwendung von Fremdwörtern ist dem Adressatenkreis anzupassen."),
                  overflow: TextOverflow.ellipsis,
                ),
                Divider(),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: kSecondaryColor),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Column(
                    children: const [
                      Text(
                        'Samstag',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.lightGreen,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '19.03.2022',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                          fontSize: 22,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '16:00 - 22:00',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  //  Text(
                  //   'ab sofort',
                  //   style: TextStyle(
                  //     fontWeight: FontWeight.w700,
                  //     color: Colors.lightGreen,
                  //   ),
                  // ),
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.location_pin),
                        SizedBox(width: 5),
                        RichText(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          text: TextSpan(
                            text: "Zwickau",
                            style: TextStyle(
                              color: kTextColor,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    RichText(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      text: TextSpan(
                        text: "Mitte - Nord",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Avatar extends StatelessWidget {
  const Avatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //TODO: Navigate To UserProfileView
      },
      child: CircleAvatar(
        radius: 35.0,
        child: ClipRRect(
          child: Image.asset('assets/images/Vince.jpg'),
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
    );
  }
}


          // Image.asset(
          //   "assets/images/rasen.jpg",
          //   height: 220,
          //   width: double.infinity,
          //   fit: BoxFit.cover,
          // ),