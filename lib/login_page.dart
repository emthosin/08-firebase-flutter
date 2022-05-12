// MI2F_14_M. Thosin Yuhaililiul Hilmi_2031710032

import 'package:firebase_flutter/email.dart';
import 'package:flutter/material.dart';
import 'package:firebase_flutter/sign_in.dart';
import 'package:firebase_flutter/first_screen.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const FlutterLogo(size: 150),
              const SizedBox(height: 50),
              _signInButtonGoogle(),
              _signInButtonEmail(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signInButtonGoogle() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          side: const BorderSide(
            color: Colors.grey,
          ),
          primary: const Color.fromARGB(255, 255, 255, 255),
          fixedSize: const Size(270, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        onPressed: () {
          signInWithGoogle().then((result) {
            if (result != null) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return FirstScreen();
                  },
                ),
              );
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Image(image: AssetImage('assets/google_logo.jpg'), height: 35.0),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Sign in with Google',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _signInButtonEmail() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        side: const BorderSide(
          color: Colors.grey,
        ),
        primary: const Color.fromARGB(255, 255, 255, 255),
        fixedSize: const Size(270, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const EmailPage(),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Image(image: AssetImage('assets/email.jpg'), height: 35.0),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Email',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
