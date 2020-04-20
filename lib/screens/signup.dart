import 'package:chat_app/reusable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../constant.dart';
import 'chat/choose_chat.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:chat_app/model/user.dart';

class SignUpPage extends StatefulWidget {
  static const id = 'signup_screen';

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _auth = FirebaseAuth.instance;
  String email;
  String fullName;
  String phoneNumber;
  bool showSpinner = false;
  final user = Firestore.instance.collection('users');
  var password;
  User currentUser;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                          'Sign up',
                          style: signUpText,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    TextFiled(
                      text: 'Full Name',
                      onChanged: (value) => fullName = value,
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    TextFiled(
                      text: 'Phone Number',
                      onChanged: (val) => phoneNumber = val,
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
                          final newUser =
                              await _auth.createUserWithEmailAndPassword(
                                  email: email.trim(), password: password);
                          if (newUser != null) {
//                            createUsers();
                            Navigator.pushNamed(context, ChooseChat.id);
                          }
                          setState(() {
                            showSpinner = false;
                          });
                        } catch (e) {
                          print(e);
                        }
                      },
                      child: ReusableContainerSignUpCode(
                        text: 'CREATE ACCOUNT',
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

//  createUsers() async {
//    DocumentSnapshot doc = await user.document().get();
//    if (!doc.exists) {
//      user.document().setData({
//        "email": email,
//        "fullname": fullName,
//      });
//      doc = await user.document().get();
//    }
//    currentUser = User.fromDocument(doc);
//  }
}
