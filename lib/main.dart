// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// // import 'package:not_whatsapp/example.dart';
// // import 'package:firebase_core/firebase_core.dart';
// // import 'firebase_options.dart';
// import 'firebase_options.dart';

// // import 'mainui.dart';
// import 'Login_Page.dart';

// import 'package:firebase_core/firebase_core.dart';

// void main() async {
//   // WidgetsFlutterBinding.ensureInitialized();
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   WidgetsFlutterBinding.ensureInitialized();
//   DartPluginRegistrant.ensureInitialized();
//   // SharedPreferences prefs = await SharedPreferences.getInstance();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   // await Firebase.initializeApp();
//   // runApp(const createnewaccount());
//   bool? boolValue = prefs.getBool('option');
  
//   print('sing in $boolValue');
//   runApp(
    
//       MaterialApp(debugShowCheckedModeBanner: false, home: PhoneAuthScreen()));
// }

// // await Firebase.initializeApp(
// //   options: DefaultFirebaseOptions.currentPlatform,
// // );

// // void main() {
// //   runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: createnewaccount()));
// // }



// import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:not_whatsapp/Login_Page.dart';
import 'package:not_whatsapp/firebase_options.dart';
import 'package:not_whatsapp/mainui.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';


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
