import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  doRegisterUser(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return e;
      } else if (e.code == 'email-already-in-use') {
        return e;
      }
    }
  }

  doLoginUser(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return e;
      } else if (e.code == 'wrong-password') {
        return e;
      } else {
        return e;
      }
    }
  }

  doLogOutUser() async {
    await FirebaseAuth.instance.signOut();
  }
}
