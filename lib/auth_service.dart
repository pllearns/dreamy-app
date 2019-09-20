import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AuthService with ChangeNotifier {
  var currentUser;

  AuthService() {
    print('new AuthService');
  }

  Future getUser() {
    return Future.value(currentUser);
  }

  Future logout() {
    this.currentUser = null;

    notifyListeners();
    return Future.value(currentUser);
  }

  Future createUser({
    String email,
    String password
  }) async {}

  Future loginUser({String email, String password}) {
    if (password == Firestore.instance.collection('users.password').toString()) {
      this.currentUser = {'email': email};
      notifyListeners();
      return Future.value(currentUser);
    } else {
      this.currentUser = null;
      return Future.value(null);
    }
  }
}