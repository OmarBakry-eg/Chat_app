import 'package:flutter/material.dart';
import 'screens/welcome.dart';
import 'screens/signup.dart';
import 'screens/login.dart';
import 'screens/chat/choose_chat.dart';
import 'screens/chat/group_chat.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
      routes: {
        WelcomePage.id: (context) => WelcomePage(),
        LoginPage.id: (context) => LoginPage(),
        SignUpPage.id: (context) => SignUpPage(),
        ChooseChat.id: (context) => ChooseChat(),
        GroupChatScreen.id: (context) => GroupChatScreen(),
        //  MainPrivateScreen.id: (context) => MainPrivateScreen(),
      },
    );
  }
}
