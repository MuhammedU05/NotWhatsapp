import 'package:flutter/material.dart';
import 'package:not_whatsapp/createnewaccount.dart';
import 'package:not_whatsapp/otp.dart';


class signUp extends StatefulWidget {
  const signUp({Key? key}) : super(key: key);

  @override
  _signUPState createState() => _signUPState();
}

class _signUPState extends State<signUp> {
  List<TextEditingController> otpControllers = List.generate(6, (index) => TextEditingController());
  List<FocusNode> FocusNodes = List.generate(6, (index) => FocusNode());
  bool isMobileNumberEntered = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
       SingleChildScrollView(
         child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[SizedBox(height: 200,),
            Icon(Icons.people,size: 100,),
       
            Text('Create my Account',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
            Container(
              color: Color(0xFFF6F7F8),
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
                  TextField(
                    controller: isMobileNumberEntered ? otpControllers[0] : null,
                    decoration: InputDecoration(
                      hintText: 'Mobile number',
                      border: OutlineInputBorder(),
                      labelText: 'Mobile number',
                    ),
                  ),
                  SizedBox(height: 20, width: 50), // Add spacing
                  ElevatedButton(
                    onPressed: () {
                            Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Otp()
                            ),
                            );
                    //  setState(() {
                       // isMobileNumberEntered = true;
                    //  });
                    },
                    child: Column(
                      children: [
                        Text('Submit Mobile Number',),  
                      ], 
                    ), 
                  ),
                ],
              ),
            ),
            // ignore: prefer_const_constructors
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [  
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('continue With Google '),
                    Image.asset('assets/google.png',scale:18,),
                  ],
                ),
                SizedBox(height: 200,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [  
                    Text('Already register?'),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const createnewaccount()
                            ),
                            );
                  },
                  child: Text('Login',style: TextStyle(fontWeight: FontWeight.bold),))],)
              ],
            ),
          ],
             ),
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
