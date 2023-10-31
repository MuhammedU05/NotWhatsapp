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
//   bool isMobileNumberEntered = false;
//   int countdown = 60;

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
//                 TextField(
//                   controller: isMobileNumberEntered ? otpControllers[0] : null,
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
//                       // verifyPhoneNumber()
//                       isMobileNumberEntered = true;
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

// void verifyPhoneNumber(String phoneNumber) async {
//   await FirebaseAuth.instance.verifyPhoneNumber(
//     phoneNumber: phoneNumber,
//     verificationCompleted: (PhoneAuthCredential credential) {
//       // This callback will be invoked in the case of instant verification. For example, Google Authenticator is able to verify without user interaction.
//       FirebaseAuth.instance.signInWithCredential(credential);
//     },
//     verificationFailed: (FirebaseAuthException e) {
//       print(e.message);
//     },
//     codeSent: (String verificationId, int? resendToken) {
//       // Save the verification ID and resend token to use later
//       String smsCode = '123456'; // Provide the user's SMS code here
//       PhoneAuthCredential credential = PhoneAuthProvider.credential(
//           verificationId: verificationId, smsCode: smsCode);
//       FirebaseAuth.instance.signInWithCredential(credential);
//     },
//     codeAutoRetrievalTimeout: (String verificationId) {
//       // Auto-resolution timed out, so the user should verify manually using their code
//     },
//   );
// }

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

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:not_whatsapp/AddProfile_Page.dart';
import 'package:not_whatsapp/Settingspage.dart';
import 'package:permission_handler/permission_handler.dart';
// import 'package:not_whatsapp/main.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class PhoneAuthScreen extends StatefulWidget {
  const PhoneAuthScreen({super.key});

  @override
  _PhoneAuthScreenState createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  List<TextEditingController> otpControllers =
      List.generate(6, (index) => TextEditingController());
  List<FocusNode> focusNodes = List.generate(6, (index) => FocusNode());
  TextEditingController PhoneNumber = TextEditingController();
  String _phoneNumber = '';
  String myPhoneNumber = '';
  String _verificationId = '';
  String otp = '';
  bool phVerified = false;
  get index => -1;

//   final User? user = FirebaseAuth.instance.currentUser;
//   final CollectionReference users = FirebaseFirestore.instance.collection('users');
//   Future<void> addUserDetails(String Name,String Bio,String phoneNumber) {
//   return users
//       .doc(user!.uid)
//       .set({
//         'UUID':user?.uid,
//         'Name': Name,
//         'Email': user?.email,
//         'Number': phoneNumber,
//         'Bio': Bio,
//         // Add more fields as per your requirement
//       })
//       .then((value) => print("User Details Added"))
//       .catchError((error) => print("Failed to add user details: $error"));
// }

  Future<void> _requestSMSPermission() async {
    final status = await Permission.sms.request();
    if (status.isGranted) {
      print('SMS permission granted');
    } else if (status.isDenied) {
      print('SMS permission denied');
    } else if (status.isPermanentlyDenied) {
      print('SMS permission permanently denied');
    }
  }

  @override
  void initState() {
    super.initState();
    _requestSMSPermission();
  }

  Future<void> verifyPhoneNumber() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.setSettings(appVerificationDisabledForTesting: false);
    // var snapshot = await FirebaseFirestore.instance.collection('User').get();

    try {
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
    } catch (e) {
      print('Error during phone number verification: $e');
    }
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
      setLoggedInStatus(true);
      // addUserDetails('','',_phoneNumber);
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == 'firebase_auth/invalid-verification-code') {
          print(
              'Invalid verification code. Please check and enter the correct verification code again.');
        } else {
          print('Failed to sign in. Error Code: ${e.code}');
        }
      } else {
        print('An error occurred: $e');
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
              // scale: BorderSide.strokeAlignOutside
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Text(
              'Login panel',
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
                    controller: PhoneNumber,
                    onChanged: (value) {
                      setState(() {
                        _phoneNumber = value;
                        myPhoneNumber = value;
                      });
                      // print(_phoneNumber);
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter phone number',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      verifyPhoneNumber;
                      setLoggedInStatus(true);
                    },
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
          ),
        ]));
  }
}
