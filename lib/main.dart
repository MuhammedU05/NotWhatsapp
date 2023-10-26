import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:not_whatsapp/example.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';
import 'firebase_options.dart';

// import 'mainui.dart';
// import 'Login_Page.dart';

import 'package:firebase_core/firebase_core.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await Firebase.initializeApp();
  // runApp(const createnewaccount());
  runApp(
     MaterialApp(debugShowCheckedModeBanner: false, home: PhoneAuthScreen()));
}

// await Firebase.initializeApp(
//   options: DefaultFirebaseOptions.currentPlatform,
// );

// void main() {
//   runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: createnewaccount()));
// }

var themeColorGreen = const Color.fromARGB(255, 9, 110, 81);

