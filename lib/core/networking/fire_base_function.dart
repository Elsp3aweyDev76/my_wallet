import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FireBaseFunction {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
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

  Future<void> addtransection(
    String userId,
    String name,
    String price,
    String date,
  ) async {
    try {
      await firestore
          .collection("userTransactin")
          .doc(userId)
          .collection("transactions")
          .add({"name": name, "price": price, "date": date});
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  // دالة حذف معاملة معينة
  Future<void> deleteTransaction(String userId, String transactionId) async {
    try {
      await firestore
          .collection("userTransactin")
          .doc(userId)
          .collection("transactions")
          .doc(transactionId) // تحديد المعاملة بناءً على الـ ID الفريد لها
          .delete();
    } on Exception catch (e) {
      if (kDebugMode) {
        print("Error deleting transaction: ${e.toString()}");
      }
    }
  }
}
