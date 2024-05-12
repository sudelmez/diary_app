import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary_app/core/modules/user/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../base/modules/alert/show_alert.dart';
import '../../base/modules/navigation/navigation_paths.dart';
import '../../base/modules/navigation/navigation_service.dart';

class FirebaseAuthMethod {
  final FirebaseAuth _auth;
  final userCollection = FirebaseFirestore.instance.collection("users");
  FirebaseAuthMethod(this._auth);

  Future<void> register({required BuildContext context, required UserModel user, required String password}) async {
    try {
      final UserCredential credential = await _auth.createUserWithEmailAndPassword(email: user.email, password: password);
      if (credential.user != null) {
        setUserDatas(context: context, user: user);
      }
    } on FirebaseAuthException catch (e) {
      AlertManager.instance.showSnack(SnackType.error, message: e.message);
    }
  }

  Future<void> setUserDatas({required BuildContext context, required UserModel user}) async {
    try {
      await userCollection.add({"email": user.email, "phone": user.phone});
      AlertManager.instance.showSnack(SnackType.success, message: "Kayıt Edildi");
      NavigationService.instance.navigateToPage(path: NavigationPaths.home);
    } on FirebaseAuthException catch (e) {
      AlertManager.instance.showSnack(SnackType.error, message: e.message);
    }
  }
}
