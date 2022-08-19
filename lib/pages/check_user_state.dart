import 'package:app_ui/pages/check_user_auth.dart';
import 'package:app_ui/pages/logged_in_page.dart';
import 'package:app_ui/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CheckUserState extends StatelessWidget {
  const CheckUserState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return LoggedInPage();
          } else {
            return CheckUserAuth();
          }
        },
      ),
    );
  }
}
