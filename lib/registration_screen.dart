import 'package:flutter/material.dart';
import 'package:gimigfirebasetestgastro/choose_screen.dart';
import 'package:gimigfirebasetestgastro/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationScreen extends StatelessWidget {
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
            "Registraton",
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
            children: <Widget>[
              FlatButton(
                onPressed: () async {
                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    if (newUser != null) {
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
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  }
                },
                child: Text(
                  "log in",
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
