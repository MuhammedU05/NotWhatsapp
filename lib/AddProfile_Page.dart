
import 'package:flutter/material.dart';
import 'package:not_whatsapp/Settingspage.dart';
import 'package:not_whatsapp/chat_screen.dart';
import 'package:not_whatsapp/mainui.dart';
import 'package:shared_preferences/shared_preferences.dart';

class addProfile extends StatefulWidget {
  const addProfile({Key? key}) : super(key: key);

  @override
  State<addProfile> createState() => _addProfileState();
}

class _addProfileState extends State<addProfile> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController aboutController = TextEditingController(); // New TextEditingController for About
  String name = "";
  String about = ""; // New variable for About

  @override
  void initState() {
    super.initState();
    _loadName();
  }

  Future<void> _loadName() async {
    final prefs = await SharedPreferences.getInstance();
    final savedName = prefs.getString('name');
    final savedAbout = prefs.getString('about'); // Load the saved About
    if (savedName != null) {
      setState(() {
        name = savedName;
        nameController.text = name;
      });
    }
    if (savedAbout != null) {
      setState(() {
        about = savedAbout;
        aboutController.text = about;
      });
    }
  }

  Future<void> _saveName(String newName) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', newName);
  }

  Future<void> _saveAbout(String newAbout) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('about', newAbout); // Save the About
  }

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
                      borderRadius: BorderRadius.circular(150),
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.camera_alt,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                icon: Icon(Icons.person),
                hintText: 'Enter your Name',
              ),
              onChanged: (newName) {
                setState(() {
                  name = newName;
                });
              },
            ),
            SizedBox(height: 23),
            TextField(
              controller: aboutController,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                icon: Icon(Icons.info_outline),
                hintText: 'About',
              ),
              onChanged: (newAbout) {
                setState(() {
                  about = newAbout;
                });
              },
            ),
            SizedBox(height: 23),
            ElevatedButton(
  onPressed: () async {
    await _saveName(name); // Save the name
    await _saveAbout(about); // Save the About
    await Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MainApp(name: '',), // Navigate to the main app
      ),
    );
  },
  child: Text('Save'),
),




          ]
      ),
      ),
    );
  }
}
