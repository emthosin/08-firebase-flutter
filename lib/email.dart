import 'package:firebase_flutter/sign_in.dart';
import 'package:flutter/material.dart';

import 'first_screen.dart';

class EmailPage extends StatelessWidget {
  const EmailPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 10,
          elevation: 0,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(children: [
                const FlutterLogo(size: 150),
                SizedBox(height: size.height * 0.03),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    //controller: usernameController,
                    validator: (String val) =>
                        val.isEmpty ? 'Masukkan Username Anda' : null,
                    decoration: const InputDecoration(
                      labelText: "Email",
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(horizontal: 36),
                  child: TextFormField(
                    style: const TextStyle(color: Color(0xFF82786E)),
                    //controller: passwordController,
                    validator: (String val) =>
                        val.isEmpty ? 'Masukkan Password Anda' : null,
                    decoration: const InputDecoration(
                      labelText: "Password",
                    ),
                    obscureText: true,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 40, bottom: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      side: const BorderSide(
                        color: Colors.grey,
                      ),
                      primary: const Color.fromARGB(255, 255, 255, 255),
                      fixedSize: const Size(250, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    onPressed: () {
                      signInEmail().then((result) {
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
                    child: const Text(
                      "Masuk",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                      ),
                    ),
                    //On Pressed
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(
                      color: Colors.grey,
                    ),
                    primary: const Color.fromARGB(255, 255, 255, 255),
                    fixedSize: const Size(250, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  onPressed: () {
                    signUpEmail().then((result) {
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
                  child: const Text(
                    "Daftar",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                  //onPressed
                ),
              ])
            ],
          ),
        ));
  }
}
