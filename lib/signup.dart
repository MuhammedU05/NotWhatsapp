import 'package:flutter/material.dart';

class signUp extends StatefulWidget {
  const signUp({Key? key}) : super(key: key);

  @override
  _signUPState createState() => _signUPState();
}

class _signUPState extends State<signUp> {
  List<TextEditingController> otpControllers = List.generate(6, (index) => TextEditingController());
  bool isMobileNumberEntered = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                    setState(() {
                      isMobileNumberEntered = true;
                    });
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
            children: const [
              Text('continue With Google'),
              SizedBox(height: 200,),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                
                children: [  
                  Text('Already register?'),
              Text('Login',style: TextStyle(fontWeight: FontWeight.bold),)],)
            
            ],
          ),
          if (isMobileNumberEntered)
            Container(
              color: Color.fromARGB(255, 245, 246, 245),
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
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            counterText: "",
                          ),
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 20, width: 50), // Add spacing between the OTP input and the "Login" button
                  ElevatedButton(
                    onPressed: () {
                      // Add your login logic here
                    },
                    child: Text('Create my account'),
                  ),
                ],
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
