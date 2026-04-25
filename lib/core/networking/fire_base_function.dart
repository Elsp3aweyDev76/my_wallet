import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FireBaseFunction {
  FirebaseAuth auth = FirebaseAuth.instance;
  Future<User?> loginUser(String email, String password) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw SnackBar(content: Text("No user found for that email."));
      } else if (e.code == 'wrong-password') {
        throw SnackBar(content: Text("Wrong password provided for that user."));
      }
    }
    return null;
  }

  Future<User?> signUpUser(String email, String password) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw SnackBar(content: Text("The password provided is too weak."));
      } else if (e.code == 'email-already-in-use') {
        throw SnackBar(
          content: Text("The account already exists for that email."),
        );
      }
    }
    return null;
  }
  Future logout() async {
    await auth.signOut();
  }
  User? currnetUser(){
    return auth.currentUser;
  }
}
