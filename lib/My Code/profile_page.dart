import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:not_whatsapp/main.dart';

class profilePage extends StatefulWidget {
  const profilePage({super.key});

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  late String _name = ''; // Initialize the name variable
  late String _phno = ''; // Initialize the name variable
  final User? fireBaseUser = FirebaseAuth.instance.currentUser;

Future<void> fetchData() async {
  final DocumentSnapshot snapshot = await FirebaseFirestore.instance
      .collection('Users')
      .doc('ynLPF0ryeGSKOyEcbCsulbDi70c2') // Replace with your Uuid
      .get();
  if (snapshot.exists) {
    Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;
    if (data != null) {
      setState(() {
        _name = data['name'] ?? ''; // Set the fetched name
        _phno = data['PhNo'] ?? '';
      });
    }
  }
}

  @override
  void initState() {
    fetchData();
    super.initState();
  }

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
          SizedBox(
            height: 10,
          ),
          Text(_name,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
          SizedBox(height: 10),
          Text(
            _phno,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 15,
          ),
          // SizedBox(height: 20,)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.message),
                iconSize: 40,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.call),
                iconSize: 40,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.video_call),
                iconSize: 40,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.search),
                iconSize: 40,
              ),
            ],
          )
        ],
      ),
    ));
  }
}
