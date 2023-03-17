import 'package:firebase_auth/firebase_auth.dart';

import '../model/user_model.dart';

class AuthService {
  final FirebaseAuth _fAuth = FirebaseAuth.instance;

  Future signWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _fAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return UserModel.fromFirebase(userCredential.user!);
    } catch (e) {
      return null;
    }
  }

  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _fAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return UserModel.fromFirebase(userCredential.user!);
    } catch (e) {
      return null;
    }
  }

  Future logOut() async {
    await _fAuth.signOut();
  }

  Stream<UserModel?> get currentUser =>
      _fAuth.authStateChanges().map((User? user) =>
      (user != null) ? UserModel.fromFirebase(user!) : null);

}
