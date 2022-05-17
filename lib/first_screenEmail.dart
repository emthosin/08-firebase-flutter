// MI2F_14_M. Thosin Yuhaililiul Hilmi_2031710032

// Copyright (c) 2019 Souvik Biswas
import 'package:flutter/material.dart';
import 'package:firebase_flutter/login_page.dart';
import 'package:firebase_flutter/authentication.dart';

import 'authentication.dart';

class FirstScreenEmail extends StatelessWidget {
  const FirstScreenEmail({Key key, this.email}) : super(key: key);
  final String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.blue, Colors.blue],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text(
                email,
                style: const TextStyle(
                    fontSize: 25,
                    color: Color(0xFF673AB7),
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xFF673AB7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    signOutEmail();
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) {
                      return LoginPage();
                    }), ModalRoute.withName('/'));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Sign Out',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
