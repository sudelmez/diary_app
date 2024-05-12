import 'package:diary_app/core/base/modules/navigation/navigation_paths.dart';
import 'package:diary_app/core/base/modules/navigation/navigation_service.dart';
import 'package:diary_app/core/base/view/base_view.dart';
import 'package:diary_app/product/auth/login_viewmodel.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends LoginViewmodel {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0) + EdgeInsets.only(top: height / 3),
              child: TextField(
                controller: phoneController,
                decoration: const InputDecoration(
                  hintText: 'Enter your phone number',
                ),
                keyboardType: TextInputType.phone,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Visibility(
                visible: otpFieldVisibility,
                child: TextField(
                  controller: otpController,
                  decoration: const InputDecoration(
                    hintText: 'OTP Code',
                    labelText: 'OTP',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (otpFieldVisibility) {
                  verifyOTPCode();
                } else {
                  verifyPhone(phoneController.text);
                }
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: const Text('Send Code'),
            ),
            const SizedBox(height: 15),
            TextButton(
                onPressed: () {
                  NavigationService.instance.navigateToPage(path: NavigationPaths.register);
                },
                child: const Text("Telefon numarası kullanmadan üye olun"))
          ],
        ),
      ),
    );
  }
}
