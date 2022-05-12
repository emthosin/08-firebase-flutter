// MI2F_14_M. Thosin Yuhaililiul Hilmi_2031710032

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();
String name;
String email;
String imageUrl;
Future<String> signInWithGoogle() async {
  await Firebase.initializeApp();
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;
  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );
  final UserCredential authResult =
      await _auth.signInWithCredential(credential);
  final User user = authResult.user;
  if (user != null) {
    // Checking if email and name is null
    assert(user.email != null);
    assert(user.displayName != null);
    assert(user.photoURL != null);
    name = user.displayName;
    email = user.email;
    imageUrl = user.photoURL;
    // Only taking the first part of the name, i.e., First Name
    if (name.contains(" ")) {
      name = name.substring(0, name.indexOf(" "));
    }
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);
    final User currentUser = _auth.currentUser;
    assert(user.uid == currentUser.uid);
    print('signInWithGoogle succeeded: $user');
    return '$user';
  }
  return null;
}

Future<void> signOutGoogle() async {
  await googleSignIn.signOut();
  print("User Signed Out");
}

Future<String> signInEmail({String email, String password}) async {
  try {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
    return "Signed in";
  } on FirebaseAuthException catch (e) {
    return e.message;
  }
}

// 4
Future<String> signUpEmail({String email, String password}) async {
  try {
    await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return "Signed up";
  } on FirebaseAuthException catch (e) {
    return e.message;
  }
}

// 5
Future<String> signOutEmail() async {
  try {
    await _auth.signOut();
    return "Signed out";
  } on FirebaseAuthException catch (e) {
    return e.message;
  }
}

// 6
User getUserEmail() {
  try {
    return _auth.currentUser;
  } on FirebaseAuthException {
    return null;
  }
}
