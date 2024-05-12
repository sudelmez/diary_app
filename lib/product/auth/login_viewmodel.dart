import 'package:diary_app/core/base/modules/alert/show_alert.dart';
import 'package:diary_app/core/base/state/base_state.dart';
import 'package:diary_app/product/auth/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

abstract class LoginViewmodel extends BaseState<LoginView> {
  final TextEditingController otpController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  String receivedID = "";
  bool otpFieldVisibility = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
  }

  verifyPhone(String phone) async {
    await auth.verifyPhoneNumber(
      phoneNumber: '+90 $phone',
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
        AlertManager.instance.showSnack(SnackType.error, message: "HATA!");
      },
      codeSent: (String verificationId, int? resendToken) async {
        receivedID = verificationId;
        otpFieldVisibility = true;
        setState(() {});
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        AlertManager.instance.showSnack(SnackType.error, message: "HATA!");
      },
    );
  }

  Future<void> verifyOTPCode() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: receivedID,
      smsCode: otpController.text,
    );
    await auth.signInWithCredential(credential).then((value) => print('User Login In Successful'));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
