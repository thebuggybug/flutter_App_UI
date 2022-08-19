import 'package:app_ui/pages/login_page.dart';
import 'package:app_ui/pages/register_page.dart';
import 'package:flutter/material.dart';

class CheckUserAuth extends StatefulWidget {
  const CheckUserAuth({Key? key}) : super(key: key);

  @override
  State<CheckUserAuth> createState() => _CheckUserAuthState();
}

class _CheckUserAuthState extends State<CheckUserAuth> {
  bool showLoginPage = true;

  void toggleScreens() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(showRegisterPage: toggleScreens);
    } else {
      return RegisterPage(showLoginPage: toggleScreens);
    }
  }
}
