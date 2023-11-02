import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:not_whatsapp/My%20Code/firebase_options.dart';
import 'package:not_whatsapp/Not%20Mycode/custom_theme.dart';
import 'package:not_whatsapp/Not%20Mycode/routes_name.dart';
import 'package:not_whatsapp/Not%20Mycode/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'My Code/mainui.dart';
// import 'My Code/Login_Page.dart';


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
    runApp(MyApp()
      
      // MaterialApp(
      //   debugShowCheckedModeBanner: false,
      //   home: MyApp(), // Replace this with your home screen widget
      // ),
    );
  } else {
    runApp(MyApp()
      // MaterialApp(
      //   debugShowCheckedModeBanner: false,
      //   home: EmailSignInScreen(), // Replace this with your login screen widget
      // ),
    );
  }
}



// void main() {
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375.0, 812.0),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (BuildContext context, child) {
        return MaterialApp(
          title: KStrings.appName,
          debugShowCheckedModeBanner: false,
          initialRoute: RouteNames.splashScreen,
          onGenerateRoute: RouteNames.generateRoutes,
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: child!,
            );
          },
          theme: MyTheme.theme,
        );
      },
    );
  }
}
