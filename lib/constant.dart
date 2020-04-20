import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var chatText = GoogleFonts.oxygen(
  fontSize: 45,
  fontWeight: FontWeight.w400,
  color: Colors.white,
  shadows: [
    BoxShadow(
      color: Colors.black,
      blurRadius: 4.0,
    ),
  ],
);

var registerText = GoogleFonts.josefinSans(
  color: Colors.white,
  fontWeight: FontWeight.w600,
  fontSize: 20.0,
);

var loginText = GoogleFonts.josefinSans(
  color: Colors.black,
  fontWeight: FontWeight.w600,
  fontSize: 20.0,
);

var welcomeGradient = LinearGradient(
  colors: [
    Color(0xFF288E9F),
    Color(0xFF3CA5A9),
    Color(0xFF50B3AF),
    Color(0xFF6CCDBB),
  ],
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
);

var signUpText = GoogleFonts.lobster(
  color: Colors.black,
  fontSize: 35.0,
  fontWeight: FontWeight.w600,
  fontStyle: FontStyle.italic,
  shadows: [
    BoxShadow(
      color: Colors.white,
      blurRadius: 2.0,
    ),
  ],
);

var chooseChatText = GoogleFonts.patrickHand(
  fontStyle: FontStyle.italic,
  fontWeight: FontWeight.w400,
  color: Colors.black,
  fontSize: 24.0,
  shadows: [
    BoxShadow(
      color: Colors.white,
      blurRadius: 2.0,
    ),
  ],
);

var chooseChatAppBarText = GoogleFonts.pacifico(
  fontStyle: FontStyle.italic,
  fontWeight: FontWeight.w500,
  fontSize: 30.0,
  color: Colors.white,
);

var decorationContainerInGroupScreen = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

var textFieldDecorationInGroupScreen = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

var sendButtonStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);
