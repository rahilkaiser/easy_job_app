import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'components/chat_room_body.dart';

class MessagesScreen extends StatelessWidget {
  static String routeName = "/chat_room";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: ChatRoomBody(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                BackButton(),
                CircleAvatar(
                  backgroundImage: AssetImage("assets/images/Vince.jpg"),
                ),
                SizedBox(width: kDefaultPadding * 0.75),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Website erstellen für 500 €", //TO DO : Titel der Firma kommt hier hin
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Active 3m ago",
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                IconButton(
                  constraints: BoxConstraints(),
                  icon: Icon(Icons.local_phone),
                  onPressed: () {},
                ),
                IconButton(
                  constraints: BoxConstraints(),
                  icon: Icon(Icons.videocam),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
