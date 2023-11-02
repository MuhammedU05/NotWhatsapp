import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Login_Page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:not_whatsapp/main.dart';

class Settingpage extends StatefulWidget {
  // final String? name; // Add the name parameter

  const Settingpage({Key? key}) : super(key: key);

  @override
  State<Settingpage> createState() => _SettingpageState();
}

class _SettingpageState extends State<Settingpage> {
  late String _name = ''; // Initialize the name variable
  late String _bio = ''; // Initialize the name variable
  Future<void> fetchData() async {
  final DocumentSnapshot snapshot = await FirebaseFirestore.instance
      .collection('Users')
      .doc(user.email) // Replace with your Uuid
      .get();
  if (snapshot.exists) {
    Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;
    if (data != null) {
      setState(() {
        _name = data['name']; // Set the fetched name
        _bio = data['Bio'];
      });
    }
  }
}

  @override
  void initState() {
    fetchData();
    super.initState();
  }
  User user = FirebaseAuth.instance.currentUser!;
  final CollectionReference users =
      FirebaseFirestore.instance.collection('Users');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: themeColorGreen,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Settings"),
            IconButton(
              iconSize: 35,
              onPressed: () {},
              icon: const Icon(Icons.search),
              color: Colors.white,
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Padding(
                padding: EdgeInsets.only(right: 23),
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.red,
                  child: Text(''), // Display the user's name
                ),
              ),
              title: Text(_name),
              subtitle: Text(_bio),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(
                Icons.key,
                size: 35,
              ),
              title: const Text(
                'Account',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              subtitle: const Text("Security notifications, Change number"),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(
                Icons.contact_mail,
                size: 35,
              ),
              title: const Text(
                'Privacy',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              subtitle: const Text("Block contacts, Disappearing messages"),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(
                Icons.face,
                size: 35,
              ),
              title: const Text(
                'Avatar',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              subtitle: const Text("Create, Edit, Profile photo"),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(
                Icons.chat,
                size: 35,
              ),
              title: const Text(
                'Chats',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              subtitle: const Text("Theme, Wallpapers, Chat history"),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(
                Icons.notifications,
                size: 35,
              ),
              title: const Text(
                'Notifications',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              subtitle: const Text("Message, Group & Call tones"),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(
                Icons.storage,
                size: 35,
              ),
              title: const Text(
                'Storage and data',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              subtitle: const Text("Network usage, auto-download"),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(
                Icons.language,
                size: 35,
              ),
              title: const Text(
                'App language',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              subtitle: const Text("English (Device's Language)"),
            ),
            ListTile(
              leading: const Icon(
                Icons.help,
                size: 35,
              ),
              title: const Text(
                'Help',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              subtitle: const Text("Help center, Contact us, Privacy policy"),
            ),
            ListTile(
              leading: const Icon(
                Icons.inventory_2_outlined,
                size: 35,
              ),
              title: const Text(
                'Invite a Friend',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
            Center(
                child: TextButton(
              child: Text('Sign Out'),
              onPressed: () {
                setLoggedInStatus(false);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EmailSignInScreen()));
              },
            ))
          ],
        ),
      ),
    );
  }
}

void setLoggedInStatus(bool value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('isLoggedIn', value);
}
