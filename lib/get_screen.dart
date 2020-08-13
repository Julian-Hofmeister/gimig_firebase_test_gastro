import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GetScreen extends StatefulWidget {
  @override
  _GetScreenState createState() => _GetScreenState();
}

class _GetScreenState extends State<GetScreen> {
  final _firestore = Firestore.instance;
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;

  @override
  void initState() {
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
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              StreamBuilder<QuerySnapshot>(
                stream: _firestore.collection('messages').snapshots(),
                // ignore: missing_return
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.orangeAccent,
                      ),
                    );
                  }
                  final messages = snapshot.data.documents;
                  List<Widget> messageWidgets = [];
                  for (var message in messages) {
                    final messageText = message.data['text'];
                    final messageSender = message.data['sender'];

                    final messageWidget = Container(
                      margin: EdgeInsets.all(8),
                      child: Center(child: Text('$messageText')),
                      width: 300,
                      height: 40,
                      color: Colors.orangeAccent,
                    );

                    if (messageSender == loggedInUser.email) {
                      messageWidgets.insert(0, messageWidget);
                    }
                  }
                  return Column(
                    children: <Widget>[
                      Container(
                        height: 400,
                        child: ListView(
                          children: messageWidgets,
                        ),
                      )
                    ],
                  );
                },
              ),
            ],
          ),
        ));
  }
}
