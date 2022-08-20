import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;

  const RegisterPage({Key? key, required this.showLoginPage}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatPasswordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _repeatPasswordController.dispose();
    super.dispose();
  }

  Future signUp() async {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(
            color: Colors.deepPurpleAccent[100],
          ),
        );
      },
    );

    if (passwordConfirmed()) {
      FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
    }

    Navigator.of(context).pop();
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _repeatPasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  // Future phone() async {
  //   FirebaseAuth.instance.signInWithP
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    // height: 70,
                    ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(left: 24),
                  child: Row(
                    children: [
                      Text(
                        "Sign UP",
                        style: GoogleFonts.bebasNeue(fontSize: 70),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(left: 16),
                  child: Text(
                    "Register",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.italic),
                  ),
                ),
                SizedBox(
                  height: 60,
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

                SizedBox(
                  height: 12,
                ),

                // PASSWORD
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
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: ("Your password"),
                          labelText: ("PASSWORD"),
                          prefixIcon: Icon(Icons.lock),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 12,
                ),

                //Repeat PWD
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Container(
                    padding: EdgeInsets.only(left: 12),
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        border: Border.all(color: Colors.white70),
                        borderRadius: BorderRadius.circular(12)),
                    child: Container(
                      alignment: Alignment.center,
                      height: 60,
                      child: TextField(
                        controller: _repeatPasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: ("Repeat your password"),
                          labelText: ("REPEAT PASSWORD"),
                          prefixIcon: Icon(Icons.lock),
                        ),
                      ),
                    ),
                  ),
                ),

                // Sign up Button
                SizedBox(
                  height: 36,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: Container(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.all<Color>(Colors.white54),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blueAccent),
                        // animationDuration: Duration(seconds: 4),
                      ),
                      onPressed: () {
                        signUp();
                      },
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have ann account? Let's "),
                    GestureDetector(
                      onTap: widget.showLoginPage,
                      child: Text(
                        "Log in !",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
