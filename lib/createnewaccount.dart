import 'dart:async';

import 'package:flutter/material.dart';
import 'package:not_whatsapp/profilepicpage.dart';
import 'package:not_whatsapp/signup.dart';
// import 'package:auto_size_text/auto_size_text.dart';

class createnewaccount extends StatefulWidget {
  const createnewaccount({Key? key}) : super(key: key);

  @override
  _createnewaccountState createState() => _createnewaccountState();
}

class _createnewaccountState extends State<createnewaccount> {
  List<TextEditingController> otpControllers =
      List.generate(6, (index) => TextEditingController());
  List<FocusNode> focusNodes = List.generate(6, (index) => FocusNode());
  bool isMobileNumberEntered = false;
  int countdown = 60;

  @override
  void initState() {
    super.initState();
  }

  void startCountdown() {
  const oneSec = const Duration(seconds: 1);
  Timer.periodic(oneSec, (Timer timer) {
    if (countdown == 0) {
      timer.cancel();
      setState(() {
        countdown = 60; // Reset the countdown
      });
    } else {
      setState(() {
        countdown--;
      });
    }
  });
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
            child: Image.asset('assets/pngwing.com.png',
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
          Container(
            color: Colors.transparent,
            width: 400,
            margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                ),
                // TextField(
                //   controller: isMobileNumberEntered ? otpControllers[0] : null,
                //   decoration: InputDecoration(
                //     hintText: 'Mobile number',
                //     border: OutlineInputBorder(),
                //     labelText: 'Mobile number',
                //   ),
                // ),


                
                SizedBox(height: 20, width: 50), // Add spacing
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isMobileNumberEntered = true;
                    });
                  },
                  child: Text('Submit Mobile Number'),
                ),
              ],
            ),
          ),
          if (isMobileNumberEntered)
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
                            if (value.isNotEmpty && index < 5) {
                              focusNodes[index].unfocus();
                              focusNodes[index + 1].requestFocus();
                            } else {
                              focusNodes[index - 1].requestFocus();
                            }
                          },
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 20, width: 50),
                  if (countdown == 0)
                    ElevatedButton(
                      onPressed: () {
                        // Add your resend OTP logic here
                        setState(() {
                          countdown = 60; // Reset the countdown
                          startCountdown(); // Start the countdown again
                        });
                      },
                      child: Text('Resend OTP'),
                    )
                  else
                    Text(
                        'Resend OTP in $countdown seconds'), // Add spacing between the OTP input and the "Login" button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Profilepicpage()
                            ),
                            );
                    },
                    child: Text('Login'),
                  ),
                ],
              ),
            ),
            GestureDetector(
            onTap: () {
              Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const signUp()
                            ),
                            );
            },
            child: Text(
              'Create New Account',
              style: TextStyle(
                color: Colors.black, // You can change the text color
                decoration: TextDecoration.underline, // Add an underline
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    for (var controller in otpControllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
