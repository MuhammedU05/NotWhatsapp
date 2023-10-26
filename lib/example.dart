// // ignore_for_file: prefer_const_literals_to_create_immutables, non_constant_identifier_names, prefer_const_constructors, library_private_types_in_public_api, unused_local_variable, unnecessary_const, duplicate_ignore, camel_case_types, avoid_print, file_names

// import 'dart:async';
// // import 'firebase_options.dart';
// import 'package:flutter/material.dart';
// import 'package:not_whatsapp/AddProfile_Page.dart';
// // import 'package:not_whatsapp/CreateAcc_Page.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:not_whatsapp/otp.dart';
// // import 'package:auto_size_text/auto_size_text.dart';

// class loginPage extends StatefulWidget {
//   const loginPage({Key? key}) : super(key: key);

//   @override
//   _loginPageState createState() => _loginPageState();
// }

// class _loginPageState extends State<loginPage> {
//   List<TextEditingController> otpControllers =
//       List.generate(6, (index) => TextEditingController());
//   List<FocusNode> focusNodes = List.generate(6, (index) => FocusNode());
//   // final TextEditingController _phoneNumberController = TextEditingController();
//   bool isMobileNumberEntered = false;
//   int countdown = 60;

//   // // Function to complete the authentication process with the verification code sent to the user's phone
//   // void signInWithPhoneNumber(String verificationId, String smsCode) async {
//   //   try {
//   //     PhoneAuthCredential credential = PhoneAuthProvider.credential(
//   //         verificationId: verificationId, smsCode: smsCode);
//   //     UserCredential userCredential =
//   //         await FirebaseAuth.instance.signInWithCredential(credential);
//   //     User? user = userCredential.user;
//   //     // You can handle the signed-in user here
//   //   } on FirebaseAuthException catch (e) {
//   //     if (e.code == 'invalid-verification-code') {
//   //       print('The provided verification code is invalid.');
//   //     }
//   //   }
//   // }

//   // // Function to initiate the phone authentication process
//   // void verifyPhoneNumber(String phoneNumber) async {
//   //   await FirebaseAuth.instance.verifyPhoneNumber(
//   //     phoneNumber: phoneNumber,
//   //     verificationCompleted: (PhoneAuthCredential credential) {
//   //       // This callback will be invoked in the case of instant verification. For example, Google Authenticator is able to verify without user interaction.
//   //       FirebaseAuth.instance.signInWithCredential(credential);
//   //     },
//   //     verificationFailed: (FirebaseAuthException e) {
//   //       print(e.message);
//   //     },
//   //     codeSent: (String verificationId, int? resendToken) {
//   //       // Save the verification ID and resend token to use later
//   //       String smsCode = '123456'; // Provide the user's SMS code here
//   //       PhoneAuthCredential credential = PhoneAuthProvider.credential(
//   //           verificationId: verificationId, smsCode: smsCode);
//   //       FirebaseAuth.instance.signInWithCredential(credential);
//   //     },
//   //     codeAutoRetrievalTimeout: (String verificationId) {
//   //       // Auto-resolution timed out, so the user should verify manually using their code
//   //     },
//   //   );
//   // }

//   @override
//   void initState() {
//     super.initState();
//   }

//   void startCountdown() {
//     const oneSec = const Duration(seconds: 1);
//     Timer.periodic(oneSec, (Timer timer) {
//       if (countdown == 0) {
//         timer.cancel();
//         setState(() {
//           countdown = 60; // Reset the countdown
//         });
//       } else {
//         setState(() {
//           countdown--;
//         });
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: <Widget>[
//           Container(
//             width: 100,
//             height: 100,
//             decoration: BoxDecoration(
//               color: Colors.transparent,
//               borderRadius: BorderRadius.circular(50.0),
//             ),
//             child: Image.asset(
//               'assets/pngwing.com.png',
//               // scale: BorderSide.strokeAlignOutside
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 25),
//             child: Text(
//               'Login panel',
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
//             ),
//           ),
//           Container(
//             color: Colors.transparent,
//             width: 400,
//             margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
//             padding: EdgeInsets.all(16),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 Padding(
//                   padding: const EdgeInsets.only(bottom: 20),
//                 ),
//                 TextFormField(
//                   // controller: isMobileNumberEntered ? otpControllers[0] : null,
//                   // controller: _phoneNumberController,
//                   decoration: InputDecoration(
//                     hintText: 'Mobile number',
//                     border: OutlineInputBorder(),
//                     labelText: 'Mobile number',
//                   ),
//                 ),

//                 SizedBox(height: 20, width: 50), // Add spacing
//                 ElevatedButton(
//                   onPressed: () {
//                     setState(() {
//                       // print('\n\nError\n\n');
//                       // verifyPhoneNumber()
//                       // if (isMobileNumberEntered = true) {
//                       //   verifyPhoneNumber(_phoneNumberController.text);
//                       // }
//                     });
//                   },
//                   child: Text('Submit Mobile Number'),
//                 ),
//               ],
//             ),
//           ),
//           if (isMobileNumberEntered)
//             Container(
//               color: Colors.transparent,
//               width: 400,
//               margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
//               padding: EdgeInsets.all(16),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: List.generate(6, (index) {
//                       return Container(
//                         width: 40,
//                         height: 40,
//                         alignment: Alignment.center,
//                         decoration: BoxDecoration(
//                           border: Border.all(),
//                           borderRadius: BorderRadius.circular(6),
//                         ),
//                         child: TextField(
//                           controller: otpControllers[index],
//                           focusNode: focusNodes[index],
//                           textAlign: TextAlign.center,
//                           keyboardType: TextInputType.number,
//                           maxLength: 1,
//                           decoration: InputDecoration(
//                             border: InputBorder.none,
//                             counterText: "",
//                           ),
//                           onChanged: (value) {
//                             if (value.isNotEmpty && index < 5) {
//                               focusNodes[index].unfocus();
//                               focusNodes[index + 1].requestFocus();
//                             } else {
//                               focusNodes[index - 1].requestFocus();
//                             }
//                           },
//                         ),
//                       );
//                     }),
//                   ),
//                   SizedBox(height: 20, width: 50),
//                   if (countdown == 0)
//                     ElevatedButton(
//                       onPressed: () {
//                         // Add your resend OTP logic here
//                         setState(() {
//                           countdown = 60; // Reset the countdown
//                           startCountdown(); // Start the countdown again
//                         });
//                       },
//                       child: Text('Resend OTP'),
//                     )
//                   else
//                     Text(
//                         'Resend OTP in $countdown seconds'), // Add spacing between the OTP input and the "Login" button
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => const addProfile()),
//                       );
//                     },
//                     child: Text('Login'),
//                   ),
//                 ],
//               ),
//             ),
//           GestureDetector(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const createAcc()),
//               );
//             },
//             child: Text(
//               'Create New Account',
//               style: TextStyle(
//                 color: Colors.black, // You can change the text color
//                 decoration: TextDecoration.underline, // Add an underline
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     for (var controller in otpControllers) {
//       controller.dispose();
//     }
//     super.dispose();
//   }
// }

// // For signing in an existing user
// // void signInUser(String email, String password) async {
// //   try {
// //     UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
// //       email: email,
// //       password: password,
// //     );
// //     User? user = userCredential.user;
// //     // You can do something with the user here
// //   } on FirebaseAuthException catch (e) {
// //     if (e.code == 'user-not-found') {
// //       print('No user found for that email.');
// //     } else if (e.code == 'wrong-password') {
// //       print('Wrong password provided for that user.');
// //     }
// //   }
// // }

// class createAcc extends StatefulWidget {
//   const createAcc({Key? key}) : super(key: key);

//   @override
//   _createAccState createState() => _createAccState();
// }

// class _createAccState extends State<createAcc> {
//   List<TextEditingController> otpControllers =
//       List.generate(6, (index) => TextEditingController());
//   List<FocusNode> FocusNodes = List.generate(6, (index) => FocusNode());
//   bool isMobileNumberEntered = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             SizedBox(
//               height: 200,
//             ),
//             Icon(
//               Icons.people,
//               size: 100,
//             ),

//             Text(
//               'Create my Account',
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
//             ),
//             Container(
//               color: Color(0xFFF6F7F8),
//               width: 400,
//               margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
//               padding: EdgeInsets.all(16),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   Padding(
//                     padding: const EdgeInsets.only(bottom: 20),
//                   ),
//                   TextField(
//                     controller:
//                         isMobileNumberEntered ? otpControllers[0] : null,
//                     decoration: InputDecoration(
//                       hintText: 'Mobile number',
//                       border: OutlineInputBorder(),
//                       labelText: 'Mobile number',
//                     ),
//                   ),
//                   SizedBox(height: 20, width: 50), // Add spacing
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => const Otp()),
//                       );
//                       //  setState(() {
//                       // isMobileNumberEntered = true;
//                       //  });
//                     },
//                     child: Column(
//                       children: [
//                         Text(
//                           'Submit Mobile Number',
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             // ignore: prefer_const_constructors
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text('continue With Google '),
//                     Image.asset(
//                       'assets/google.png',
//                       scale: 18,
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 200,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text('Already register?'),
//                     GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => const loginPage()),
//                           );
//                         },
//                         child: Text(
//                           'Login',
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ))
//                   ],
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     for (var controller in otpControllers) {
//       controller.dispose();
//     }
//     super.dispose();
//   }
// }
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:not_whatsapp/AddProfile_Page.dart';

class PhoneAuthScreen extends StatefulWidget {
  @override
  _PhoneAuthScreenState createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  List<TextEditingController> otpControllers =
      List.generate(6, (index) => TextEditingController());
  List<FocusNode> focusNodes = List.generate(6, (index) => FocusNode());
  String _phoneNumber = '';
  String _verificationId = '';
  String otp = '';
  bool phVerified = false;
  get index => -1;

  Future<void> verifyPhoneNumber() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.setSettings(appVerificationDisabledForTesting: true);

    await auth.verifyPhoneNumber(
      phoneNumber: _phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
        print('Phone number automatically verified and user signed in');
      },
      verificationFailed: (FirebaseAuthException e) {
        setState(() {
          phVerified = false;
        });
        print(
            '\n\nPhone number verification failed. Code: ${e.code}. Message: ${e.message}');
      },
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          _verificationId = verificationId;
          phVerified = true;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        setState(() {
          _verificationId = verificationId;
        });
      },
    );
  }

  Future<void> signInWithPhoneNumber(String smsCode) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      AuthCredential credential = PhoneAuthProvider.credential(
          verificationId: _verificationId, smsCode: smsCode);
      await auth.signInWithCredential(credential);
      setState(() {
        // Clear OTP after successful sign-in
        for (int i = 0; i < otpControllers.length; i++) {
          otpControllers[i].clear();
        }
        otp = '';
      });
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => addProfile()),
      );
      print('Successfully signed in');
    } catch (e) {
      // Handle errors more gracefully, display an error message
      print('Failed to sign in. Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/Blue background wallpaper by MaDBut4er - Download on ZEDGE™ _ da92.png'), // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(50.0),
                      
                      
                    ),
                    child: Image.asset(
                      'assets/pngwing.com.png',
                      height: 30,
                      width: 40,
                      
                    ),
                    
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 80),
                  child: Text(
                    'Login panel',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      _phoneNumber = value;
                    });
                    // print(_phoneNumber);
                  },
                  decoration: InputDecoration(hintText: 'Enter phone number'),
                ),
                ElevatedButton(
                  onPressed: verifyPhoneNumber,
                  child: Text('Send OTP'),
                ),
                SizedBox(height: 20),
                if (phVerified == true)
                  Container(
                    color: Colors.transparent,
                    width: 400,
                    margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                    padding: EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(6, (index) {
                            return Container(
                              width: 40,
                              height: 40,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: TextField(
                                controller: otpControllers[index],
                                focusNode: focusNodes[index],
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                maxLength: 1,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  counterText: "",
                                ),
                                onChanged: (value) {
                                  if (value.isNotEmpty) {
                                    if (index < 5) {
                                      focusNodes[index + 1].requestFocus();
                                    } else {
                                      focusNodes[index].unfocus();
                                    }
                                    otp = '';
                                    for (int i = 0; i < 6; i++) {
                                      otp += otpControllers[i].text;
                                    }
                                    if (otp.length == 6) {
                                      signInWithPhoneNumber(otp);
                                    }
                                  } else {
                                    if (index > 0) {
                                      focusNodes[index - 1].requestFocus();
                                    }
                                  }
                                },
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
