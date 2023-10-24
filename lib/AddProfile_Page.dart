import 'package:flutter/material.dart';
import 'package:not_whatsapp/mainui.dart';

class addProfile extends StatefulWidget {
  const addProfile({super.key});

  @override
  State<addProfile> createState() => _addProfileState();
}

class _addProfileState extends State<addProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Add Profile",
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 100,
                ),
                Positioned(
                    right: -0,
                    bottom: 0,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(150)
                          //more than 50% of width makes circle
                          ),
                      child: IconButton(
                        icon: Icon(
                          Icons.camera_alt,
                        ),
                        onPressed: () {},
                      ),
                    ))
              ],
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  icon: Icon(Icons.person),
                  hintText: 'Enter your Name'),
            ),
            SizedBox(height: 23),
            TextField(
              decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  icon: Icon(Icons.info_outline),
                  hintText: 'About'),
            ),
            SizedBox(height: 23),
            Text('phone number'),
            SizedBox(height: 23),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MainApp()),
                );
              },
              child: Text(
                'Save',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
