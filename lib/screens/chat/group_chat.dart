import 'package:flutter/material.dart';
import '../../constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../welcome.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _store = Firestore.instance;
FirebaseUser loggedInUser;

class GroupChatScreen extends StatefulWidget {
  static const id = 'group_chat_screen';
  @override
  _GroupChatScreenState createState() => _GroupChatScreenState();
}

class _GroupChatScreenState extends State<GroupChatScreen> {
  final _auth = FirebaseAuth.instance;
  String messageText;
  final messageTextController = TextEditingController();
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

//  void getMessages() async {
//    final messages = await _store.collection('messages').getDocuments();
//    for (var message in messages.documents) {
//      print(message.data);
//    }
//  }
//  void messageStream() async {
//    await for (var snapshot
//        in _store.collection('messages').snapshots()) //subScripe to listen
//      for (var message in snapshot.documents) print(message.data);
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
//                messageStream();
                _auth.signOut();
                Navigator.of(context).pushNamed(WelcomePage.id);
              }),
        ],
        title: Text(
          '⚡️Chat',
          style: chooseChatAppBarText,
        ),
        backgroundColor: Color(0xFF3CA5A9),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessagesStream(),
            Container(
              decoration: decorationContainerInGroupScreen,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (value) {
                        messageText = value;
                      },
                      decoration: textFieldDecorationInGroupScreen,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      messageTextController.clear();
                      _store.collection('messages').add({
                        'text': messageText,
                        'sender': loggedInUser.email,
                        "time": DateTime.now(),
                      });
                    },
                    child: Text(
                      'Send',
                      style: sendButtonStyle,
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

class MessagesStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _store.collection('messages').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final messages = snapshot.data.documents;
        List<MessageBubble> messageBubbles = [];
        for (var message in messages) {
          final messageText = message.data['text'];
          final messageSender = message.data['sender'];
          final messageTime = message.data["time"];

          final currentUser = loggedInUser.email;

          final messageBubble = MessageBubble(
            sender: messageSender,
            text: messageText,
            time: messageTime,
            isMe: currentUser == messageSender,
          );

          messageBubbles.add(messageBubble);
          messageBubbles.sort((a, b) => b.time.compareTo(a.time));
        }
        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            children: messageBubbles,
          ),
        );
      },
    );
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble({this.sender, this.text, this.isMe, this.time});

  final String sender;
  final String text;
  final Timestamp time;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "$sender ${time.toDate()}",
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.black54,
            ),
          ),
          Material(
            borderRadius: isMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0))
                : BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
            elevation: 5.0,
            color: isMe ? Colors.lightBlueAccent : Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                text,
                style: TextStyle(
                  color: isMe ? Colors.white : Colors.black87,
                  fontSize: 15.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
