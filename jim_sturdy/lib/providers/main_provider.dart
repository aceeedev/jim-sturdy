import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MainProvider with ChangeNotifier {
  UserCredential? _userCredential;

  UserCredential? get userCredential => _userCredential;
  bool get hasSignedIn => _userCredential != null;

  void setUserCredential(UserCredential? userCredential) {
    _userCredential = userCredential;
  }
}
