//import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:chat_app/constant.dart';
//
//class MainPrivateScreen extends StatefulWidget {
//  static const id = 'first_private_chat_screen';
//  @override
//  _MainPrivateScreenState createState() => _MainPrivateScreenState();
//}
//
//class _MainPrivateScreenState extends State<MainPrivateScreen> {
//  final _store = Firestore.instance.collection('users');
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        backgroundColor: Color(0xFF3CA5A9),
//        leading: IconButton(
//          icon: Icon(Icons.arrow_back_ios),
//          onPressed: () {
//            Navigator.pop(context);
//          },
//        ),
//        centerTitle: true,
//        elevation: 4.0,
//        title: Text(
//          'Chat App',
//          style: chooseChatAppBarText,
//        ),
//      ),
//      body: ListView(
//        children: <Widget>[
//          StreamBuilder<QuerySnapshot>(
//              stream: _store.snapshots(),
//              builder: (context, snapshot) {
//                if (!snapshot.hasData) {
//                  return Center(
//                    child: CircularProgressIndicator(
//                      backgroundColor: Colors.lightBlue,
//                    ),
//                  );
//                }
//                final List<Widget> children = snapshot.data.documents
//                    .map((doc) => (ListTile(title: Text(doc['fullname']))))
//                    .toList();
//                return Container(
//                  width: MediaQuery.of(context).size.width,
//                  height: MediaQuery.of(context).size.height,
//                  child: ListView(
//                    children: children,
//                  ),
//                );
//              }),
//        ],
//      ),
//    );
//  }
//}
