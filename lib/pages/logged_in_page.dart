import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoggedInPage extends StatelessWidget {
  LoggedInPage({Key? key}) : super(key: key);

  @override
  final user = FirebaseAuth.instance.currentUser!;

  Widget build(BuildContext context) {
    return Scaffold(
      body: (Center(
        child: (Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Signned in as :   " + user.email!),
            MaterialButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              color: Colors.red.shade300,
              child: Text("SIGN OUT"),
            ),
          ],
        )),

      )),

    );
  }
}
