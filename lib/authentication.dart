import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
get user => _auth.currentUser;

//SIGN UP METHOD
Future signUpEmail(String email, String password) async {
  try {
    await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return null;
  } on FirebaseAuthException catch (e) {
    return e.message;
  }
}

//SIGN IN METHOD
Future signInEmail(String email, String password) async {
  try {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
    return null;
  } on FirebaseAuthException catch (e) {
    return e.message;
  }
}

//SIGN OUT METHOD
Future signOutEmail() async {
  await _auth.signOut();

  print('signout');
}
