import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gimigfirebasetestgastro/get_screen.dart';
import 'package:gimigfirebasetestgastro/send_screen.dart';

class ChooseScreen extends StatefulWidget {
  @override
  _ChooseScreenState createState() => _ChooseScreenState();
}

class _ChooseScreenState extends State<ChooseScreen> {
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SendScreen(),
                    ),
                  );
                }
              },
              child: Container(
                color: Colors.orangeAccent,
                width: 200,
                height: 200,
                child: Center(
                  child: Text(
                    "Send Data",
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GetScreen(),
                    ),
                  );
                }
              },
              child: Container(
                color: Colors.orangeAccent,
                width: 200,
                height: 200,
                child: Center(
                  child: Text(
                    "Get Data",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
