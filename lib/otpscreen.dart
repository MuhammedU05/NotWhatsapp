import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:not_whatsapp/AddProfile_Page.dart';

class OtpScreen extends StatefulWidget {
  final String verificationId;
  final String phoneNumber;
  final String countryCode;

  OtpScreen({required this.verificationId, required this.phoneNumber, required this.countryCode});

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController otpController = TextEditingController();

  // Function to verify the received OTP
  Future<void> verifyOTP(String otp) async {
    try {
      // final phone = '${widget.countryCode}${widget.phoneNumber}';
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId,
        smsCode: otp,
      );

      // Sign in with the OTP credential
      await FirebaseAuth.instance.signInWithCredential(credential);

      // Navigate to the profile page or your desired destination
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => addProfile(),
        ),
      );
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
          Text(
            'Enter the OTP sent to ${widget.countryCode} ${widget.phoneNumber}',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          // Input field for OTP
          Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              controller: otpController,
              decoration: InputDecoration(
                hintText: 'Enter OTP',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          // Verify OTP button
          ElevatedButton(
            onPressed: () {
              String otp = otpController.text;
              verifyOTP(otp);
            },
            child: Text('Verify OTP'),
          ),
        ],
      ),
    );
  }
}
