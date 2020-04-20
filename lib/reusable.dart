import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constant.dart';

class ReusableCodeInWelcomeScreen extends StatelessWidget {
  final IconData iconData;
  ReusableCodeInWelcomeScreen({this.iconData});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Icon(
            iconData,
            size: 100,
          ),
          Text(
            '\nHERE SOME TEXT',
            style: GoogleFonts.dosis(
              fontSize: 24.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

class ReusableContainerSignUpCode extends StatelessWidget {
  final String text;
  ReusableContainerSignUpCode({this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      height: 70.0,
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.all(Radius.circular(35)),
      ),
      child: Center(
        child: Text(
          text,
          style: registerText,
        ),
      ),
    );
  }
}

class ReusableLoginContainerCode extends StatelessWidget {
  final String text;
  ReusableLoginContainerCode({this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      height: 70.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(35),
        ),
        border: Border(
          top: BorderSide(color: Colors.black, width: 2),
          bottom: BorderSide(color: Colors.black, width: 2),
          left: BorderSide(color: Colors.black, width: 2),
          right: BorderSide(color: Colors.black, width: 2),
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: loginText,
        ),
      ),
    );
  }
}

class TextFiled extends StatelessWidget {
  final String text;
  final Function onChanged;
  TextFiled({this.text, this.onChanged});
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(25.0),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(32.0),
          ),
          borderSide: BorderSide(
            width: 2.0,
            color: Colors.grey[400],
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(32.0),
          ),
          borderSide: BorderSide(
            width: 2.0,
            color: Colors.grey[400],
          ),
        ),
        hintText: text,
        hintStyle: TextStyle(
          color: Colors.grey[400],
        ),
      ),
      onChanged: onChanged,
    );
  }
}

class ReusableCodeInChooseChatScreen extends StatelessWidget {
  final String text;
  ReusableCodeInChooseChatScreen({this.text});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200.0,
        height: 70.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(45)),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 3.0,
            ),
          ],
        ),
        child: Center(
          child: Text(text, style: chooseChatText),
        ),
      ),
    );
  }
}
