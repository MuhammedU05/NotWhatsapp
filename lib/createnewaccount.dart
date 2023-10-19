import 'package:flutter/material.dart';

class createnewaccount extends StatelessWidget {
  const createnewaccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 200,
            height: 150,
            decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(50.0),
          ),child: Image.asset('assets/pngwing.com.png'),
            
          ),
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
                  decoration: InputDecoration(
                    hintText: 'Mobile number',
                    border: OutlineInputBorder(),
                    labelText: 'Mobile number',
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Color.fromARGB(255, 245, 246, 245),
            width: 400,
            margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'OTP',
                  ),
                ),
                SizedBox(height: 20,width: 50,), // Add spacing between the OTP input and the "Login" button
                ElevatedButton(
                  onPressed: () {
                    // Add your login logic here
                  },
                  child: Text('Login'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
