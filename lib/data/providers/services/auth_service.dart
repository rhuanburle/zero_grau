import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../utils/hive_config.dart';

class AuthService with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Stream<User?> get authStateChanges => _auth.authStateChanges();
  final hive = HiveManager();

  String? token;
  String? userId;
  String? userEmail;
  DateTime? expiryDate;

  Future<String?> signIn({required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      if (_auth.currentUser != null) {
        token = await _auth.currentUser!.getIdToken();
        userId = _auth.currentUser!.uid;
        userEmail = _auth.currentUser!.email;
        expiryDate = DateTime.now().add(Duration(seconds: 3600));
        await hive.saveData(key: 'auth', data: true,);
        await hive.saveData(key: 'token', data: token!);
        await hive.saveData(key: 'userId', data: userId!);
        await hive.saveData(key: 'userEmail', data: userEmail!);
        await hive.saveData(key: 'expiryDate', data: expiryDate.toString());
      } else {
        return "Erro ao adicionar usuário";
      }
      return "Signed in";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  // sign out
  Future signOut() async {
    try {
      await _auth.signOut();
      await hive.deleteAllData();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<String?> signUp({required String email, required String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return "Signed up";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}