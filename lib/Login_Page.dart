import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:not_whatsapp/mainui.dart';

class EmailSignInScreen extends StatefulWidget {
  const EmailSignInScreen({Key? key}) : super(key: key);

  @override
  _EmailSignInScreenState createState() => _EmailSignInScreenState();
}

class _EmailSignInScreenState extends State<EmailSignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
      if (userCredential.user != null) {
        // Navigate to your desired screen upon successful authentication
        print('Successfully signed in with Email and Password');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MainApp()),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: Image.asset(
              'assets/pngwing.com.png',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Text(
              'Login',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
          Center(
            child: Container(
              color: Colors.transparent,
              width: 300,
              margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    onChanged: (value) {
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    obscureText: true,
                    controller: passwordController,
                    onChanged: (value) {
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  TextButton(
                    style: ButtonStyle(),
                    onPressed: () {
                      signInWithEmailAndPassword();
                    },
                    child: Text('Submit'),
                  ),
                  SizedBox(height: 40),
                  TextButton(
                    onPressed: () {
                      // Implement navigation to the account creation screen
                    },
                    child: Text('Create New Account'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
