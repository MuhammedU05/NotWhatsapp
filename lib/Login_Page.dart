import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:not_whatsapp/AddProfile_Page.dart';
import 'package:not_whatsapp/otp.dart';
import 'package:not_whatsapp/otpscreen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController countryCodeController = TextEditingController(); // Add this controller for country code

  // Function to send an OTP to the user's phone number
  Future<void> sendOTP(String phoneNumber, String countryCode) async {
    try {
      final phone = '$countryCode$phoneNumber'; // Combine country code and phone number
      await _auth.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (PhoneAuthCredential credential) {
          // Handle automatic verification (optional).
          // You can sign in the user automatically.
          _signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          // Handle verification failure.
          print(e.message);
        },
        codeSent: (String verificationId, int? resendToken) {
          // Handle when the code is sent to the user's device.
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => otpscreen(
                verificationId: verificationId,
                phoneNumber: phone, // Pass the full phone number including country code
              ),
            ),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // Handle auto-retrieval timeout.
        },
      );
    } catch (e) {
      print(e.toString());
    }
  }

  // Function to sign in the user with the received OTP
  Future<void> _signInWithCredential(PhoneAuthCredential credential) async {
    try {
      final UserCredential userCredential = await _auth.signInWithCredential(credential);
      final User? user = userCredential.user;
      // You can do something with the user here.
      if (user != null) {
        // User is signed in, navigate to the profile page or your desired destination.
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => addProfile(),
          ),
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // Input fields for country code and phone number
          TextField(
            controller: countryCodeController,
            decoration: InputDecoration(
              hintText: 'Country Code',
            ),
          ),
          TextField(
            controller: phoneNumberController,
            decoration: InputDecoration(
              hintText: 'Phone Number',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Get the mobile number and country code from the input fields
              String mobileNumber = phoneNumberController.text;
              String countryCode = countryCodeController.text;

              // Send OTP to the user's phone number
              sendOTP(mobileNumber, countryCode);
            },
            child: Text('Send OTP'),
          ),
        ],
      ),
    );
  }
}

// ...
