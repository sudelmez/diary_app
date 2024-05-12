import 'package:diary_app/core/base/state/base_state.dart';
import 'package:diary_app/product/auth/register_view.dart';
import 'package:flutter/material.dart';

abstract class RegisterViewModel extends BaseState<RegisterView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
