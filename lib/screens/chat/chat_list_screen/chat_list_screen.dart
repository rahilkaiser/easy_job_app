import 'package:easy_job_app/components/custom_nav_bar.dart';
import 'package:easy_job_app/enums.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'components/chat_list_body.dart';

class ChatListScreen extends StatefulWidget {
  static String routeName = "/chat";

  ChatListScreen({Key? key}) : super(key: key);

  @override
  _ChatListScreenState createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            labelColor: Colors.black,
            indicatorColor: kPrimaryColor,
            tabs: const [
              Tab(
                icon: Text("Meine Anfragen"),
              ),
              Tab(
                icon: Text("Meine Aufträge"),
              ),
            ],
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // SizedBox(
              //   width: 60,
              // ),
              Expanded(
                child: Text(
                  'Nachrichten',
                  // textAlign: TextAlign.center,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.search),
              )
            ],
          ),
        ),
        bottomNavigationBar:
            CustomBottomNavBar(selectedMenu: MenuState.MESSAGE),
        body: ChatListBody(),
      ),
    );
  }
}
