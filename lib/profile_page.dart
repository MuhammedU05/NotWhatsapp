// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
// import 'dart:math' as math;
import 'main.dart';

class profilePage extends StatelessWidget {
  const profilePage({super.key});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: themeColorGreen,
      toolbarHeight: 350,
      centerTitle: true,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // SizedBox(height: 40),
                CircleAvatar(
                  maxRadius: 80,
                  backgroundColor: Colors.red,
                ),
                SizedBox(height: 10,),
                Text('Name',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500
                )),
                SizedBox(height: 10),
                Text('+91 987654321',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500
                ),),
                SizedBox(height: 15,),
                // SizedBox(height: 20,)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    IconButton(onPressed: (){
                      Navigator.pop(context);
                  }, icon: Icon(Icons.message),iconSize: 40,),
                    IconButton(onPressed: (){}, icon: Icon(Icons.call),iconSize: 40,),
                    IconButton(onPressed: (){}, icon: Icon(Icons.video_call),iconSize: 40,),
                    IconButton(onPressed: (){}, icon: Icon(Icons.search),iconSize: 40,),
                  ],
                )
              ],
            ),
    )
    );
  }
}
