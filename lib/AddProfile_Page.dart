import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:not_whatsapp/mainui.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class addProfile extends StatefulWidget {
  const addProfile({Key? key}) : super(key: key);

  @override
  _AddProfileState createState() => _AddProfileState();
}

class _AddProfileState extends State<addProfile> {
  final User? firebaseUser = FirebaseAuth.instance.currentUser;
  final CollectionReference users = FirebaseFirestore.instance.collection('Users');
  TextEditingController _userName = TextEditingController();
  TextEditingController _userBio = TextEditingController();

  void addUserDetails(String userName, String userBio) {
    try {
      users.doc(firebaseUser!.email).set({
        'name': userName,
        'Bio': userBio,
        'Uuid': firebaseUser!.uid,
        'Email': firebaseUser!.email
      }).then((_) {
        print('User details added successfully');
        Navigator.push(context, MaterialPageRoute(builder: (context) => const MainApp()));
      }).catchError((error) {
        print('Failed to add user details: $error');
        // Handle the error accordingly
      });
    } on FirebaseException catch (e) {
      print('Firebase Exception: $e');
      // Handle the Firebase exceptions
    } catch (e) {
      print('Error: $e');
      // Handle other exceptions
    }
  }

  //   @override
  // void initState() {
  //   super.initState();
  //   user = FirebaseAuth.instance.currentUser!;
  //   usernameController.text = user.displayName ?? ''; // Set initial value of the TextField
  // }


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
                      //more than 50% of width makes circle
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
              controller: _userName,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                icon: Icon(Icons.person),
                hintText: 'Enter your Name',
              ),
            ),
            SizedBox(height: 23),
            TextField(
              controller: _userBio,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                icon: Icon(Icons.info_outline),
                hintText: 'About',
              ),
            ),
            SizedBox(height: 23),
            Text(
              firebaseUser!.email.toString(),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 23),
            ElevatedButton(
              onPressed: () {
                String userName = _userName.text;
                String userBio = _userBio.text;
                try {
                  FirebaseFirestore.instance
                      .collection('Users')
                      .doc(firebaseUser!.email)
                      .set({
                    'name': userName,
                    'Bio': userBio,
                    'Uuid': firebaseUser!.uid,
                    'Email': firebaseUser!.email
                  });
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const MainApp()));
                } on Exception catch (e) {
                  print('The Error is : $e');
                }
                // addUserDetails(userName, userBio);
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
