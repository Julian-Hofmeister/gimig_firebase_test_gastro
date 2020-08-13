import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gimigfirebasetestgastro/choose_screen.dart';
import 'package:gimigfirebasetestgastro/registration_screen.dart';

class LoginScreen extends StatelessWidget {
  final _auth = FirebaseAuth.instance;

  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            "Log in",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Center(
            child: Container(
              width: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("E-mail"),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      email = value;
                    },
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              width: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Password"),
                  TextField(
                    obscureText: true,
                    onChanged: (value) {
                      password = value;
                    },
                  ),
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FlatButton(
                onPressed: () async {
                  try {
                    final existingUser = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    if (existingUser != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChooseScreen(),
                        ),
                      );
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                color: Colors.orangeAccent,
                child: Text(
                  "submit",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              FlatButton(
                onPressed: () {
                  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegistrationScreen(),
                      ),
                    );
                  }
                },
                child: Text(
                  "register",
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
