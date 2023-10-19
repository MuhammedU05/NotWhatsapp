import 'package:flutter/material.dart';



class createnewaccount extends StatelessWidget {
  const createnewaccount({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: <Widget>[
          Image.asset('asset/whatsapp.png'), 
          Container(
            color: Colors.blue,
            width: 200,
            height: 100,
            margin: EdgeInsets.all(20),
            child: Center(
              child: Text('Container 1'),
            ),
          ),
          Container(
            color: Colors.green,
            width: 200,
            height: 100,
            margin: EdgeInsets.all(20),
            child: Center(
              child: Text('Container 2'),
            ),
          ),
        ],
      ),
    );
  }
}
