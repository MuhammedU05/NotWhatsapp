import 'package:flutter/material.dart';
// import 'signup.dart';

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  List<TextEditingController> otpControllers =
      List.generate(6, (index) => TextEditingController());
  List<FocusNode> FocusNodes = List.generate(6, (index) => FocusNode());
  bool isMobileNumberEntered = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
      //  mainAxisAlignment: MainAxisAlignment.center,
      //           crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          
              Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>
                [SizedBox(height: 250,),
                Text('Enter your OTP',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40),),
                SizedBox(height: 100,),
                  
                  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                    children: List.generate(6, (index) {
                      return Container(
               width: 60,
               height: 60,
               alignment: Alignment.center,
               decoration: BoxDecoration(
                 border: Border.all(),
                 borderRadius: BorderRadius.circular(6),
               ),
               child: TextField(
                 controller: otpControllers[index],
                 focusNode: FocusNodes[index],
                 textAlign: TextAlign.center,
                 keyboardType: TextInputType.number,
                 maxLength: 1,
                 decoration: InputDecoration(
                   border: InputBorder.none,
                   counterText: "",
                 ),
                 onChanged: (value) {
                   if (value.isNotEmpty && index < 5) {
                     FocusNodes[index].unfocus();
                     FocusNodes[index + 1].requestFocus();
                   } else {
                     FocusNodes[index - 1].requestFocus();
                   }
                 },
               ),
                      );
                    }),
                  ),
                  SizedBox(
                      height: 20,
                      width:
                 50), 
                 ElevatedButton(onPressed: (){

                 },
                 child: Text('Create Account'))
                ]
                
          // 
         // Add spacing between the OTP input and the "Login" button
                )
           
        ],
      ),
    );
  }
}
