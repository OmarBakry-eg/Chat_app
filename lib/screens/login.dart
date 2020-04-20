import 'package:chat_app/reusable.dart';
import 'package:flutter/material.dart';
import '../constant.dart';
import 'chat/choose_chat.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginPage extends StatefulWidget {
  static const id = 'login_screen';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = FirebaseAuth.instance;
  String email;
  bool showSpinner = false;
  var password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: ListView(
          children: <Widget>[
            Container(
              height: (MediaQuery.of(context).size.height - 10) * 0.5,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: welcomeGradient,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0),
                ),
              ),
              child: Center(
                child: Text(
                  'Chating App',
                  style: chatText,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            size: 35.0,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                      SizedBox(
                        width: 85.0,
                      ),
                      Text(
                        'Login',
                        style: signUpText,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  TextFiled(
                    text: 'E-mail Id',
                    onChanged: (value) {
                      email = value;
                    },
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  TextFiled(
                    text: 'Password',
                    onChanged: (value) {
                      password = value;
                    },
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  InkWell(
                    onTap: () async {
                      setState(() {
                        showSpinner = true;
                      });
                      try {
                        final user = await _auth.signInWithEmailAndPassword(
                            email: email.trim(), password: password.trim());
                        if (user != null) {
                          Navigator.pushNamed(context, ChooseChat.id);
                        }
                        setState(() {
                          showSpinner = false;
                        });
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: ReusableLoginContainerCode(
                      text: 'SIGN IN',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
