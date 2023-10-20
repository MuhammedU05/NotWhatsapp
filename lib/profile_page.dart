// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'main.dart';

class profilePage extends StatelessWidget {
  const profilePage({super.key});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: CustomScrollView(
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          floating: true,
          backgroundColor: themeColorGreen,
          toolbarHeight: 300,
          flexibleSpace: const FlexibleSpaceBar(
            centerTitle: true,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40),
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
                SizedBox(height: 10,),
                Text('+91 987654321',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500
                ),),
              ],
            ),
          ),
        ),
        
      ],
    ),
    );
  }
}
