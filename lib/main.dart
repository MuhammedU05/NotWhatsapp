import 'package:flutter/material.dart';
import 'package:not_whatsapp/My%20Code/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'My Code/mainui.dart';
import 'My Code/Login_Page.dart';


var themeColorGreen = const Color.fromARGB(255, 9, 110, 81);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  bool? isLoggedIn = prefs.getBool('isLoggedIn');

  // Check if the user is already logged in
  if (isLoggedIn == true) {
    runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainApp(), // Replace this with your home screen widget
      ),
    );
  } else {
    runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: EmailSignInScreen(), // Replace this with your login screen widget
      ),
    );
  }
}
