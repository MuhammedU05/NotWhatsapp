import 'package:flutter/material.dart';
class createnewaccount extends StatelessWidget {
  const createnewaccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 200,
            height: 150,
            decoration: BoxDecoration(color: Colors.transparent,borderRadius: BorderRadius.circular(50.0),
          ),child: Image.asset('assets/pngwing.com.png'),
            
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
            color: Colors.transparent,
            width: 400,
            margin: EdgeInsets.only(left: 20, right: 20),
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
                const SizedBox(height: 20), // Add spacing between the OTP input and the "Login" button
                ElevatedButton(
                  style: ButtonStyle(),
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
