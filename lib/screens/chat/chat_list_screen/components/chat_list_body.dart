import 'package:flutter/material.dart';

import '../../../../models/Chat.dart';
import '../../chat_room_screen/chat_room_screen.dart';
import 'chat_card.dart';

class ChatListBody extends StatelessWidget {
  const ChatListBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        buildList(),
        buildList(),
      ],
    );
  }

  Widget buildList() {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: chatsData.length,
            itemBuilder: (context, index) => ChatCard(
              chat: chatsData[index],
              press: () =>
                  Navigator.pushNamed(context, MessagesScreen.routeName),
            ),
          ),
        ),
      ],
    );
  }
}
