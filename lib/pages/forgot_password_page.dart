import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("The link has been sent to your email"),
            );
          });
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent.shade100,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(left: 24),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  
                  children: [
                    Text(
                      "Forgot ",
                      style: GoogleFonts.bebasNeue(fontSize: 70),
                    ),
                    Text(
                      "password ",
                      style: GoogleFonts.bebasNeue(fontSize: 70),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              padding: EdgeInsets.only(left: 12),
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  border: Border.all(color: Colors.white70),
                  borderRadius: BorderRadius.circular(12)),
              /////
              child: Container(
                alignment: Alignment.center,
                height: 60,
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: ("EMAIL"),
                    prefixIcon: Icon(Icons.email_outlined),
                    hintText: ("Your email address"),
                  ),
                ),
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {
              passwordReset();
            },
            child: Text("Reset  password"),
            color: Colors.lightBlueAccent.shade100,
          )
        ],
      ),
    );
  }
}
