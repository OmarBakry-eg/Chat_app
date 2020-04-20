import 'package:flutter/material.dart';
import '../../constant.dart';
import '../../reusable.dart';
import 'group_chat.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../welcome.dart';
import 'privateChat/mainScreen.dart';

class ChooseChat extends StatefulWidget {
  static const id = 'choose_chat_screen';

  @override
  _ChooseChatState createState() => _ChooseChatState();
}

class _ChooseChatState extends State<ChooseChat> {
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF3CA5A9),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              _auth.signOut();
              Navigator.of(context).pushNamed(WelcomePage.id);
            },
          ),
          centerTitle: true,
          elevation: 4.0,
          title: Text(
            'Chat App',
            style: chooseChatAppBarText,
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, GroupChatScreen.id);
              },
              child: ReusableCodeInChooseChatScreen(
                text: 'Group Chat',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
