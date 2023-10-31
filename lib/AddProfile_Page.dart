import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:not_whatsapp/mainui.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'Login_Page.dart';

class addProfile extends StatefulWidget {
  const addProfile({Key? key}) : super(key: key);

  @override
  _addProfileState createState() => _addProfileState();
}

class _addProfileState extends State<addProfile> {
  final User? fireBaseUser = FirebaseAuth.instance.currentUser;
  final CollectionReference users =
      FirebaseFirestore.instance.collection('Users');
  late Stream<DocumentSnapshot> _stream;
  TextEditingController _userName = TextEditingController();
  TextEditingController _userBio = TextEditingController();

  // Future<void> addUserDetails(String name, String bio) async {
  //   print(user!.uid);
  //   if (name.isEmpty) {
  //     print('Name is required');
  //     // Display an error message to the user or handle it in an appropriate way
  //     return;
  //   }

  //   try {
  //     await FirebaseFirestore.instance
  //         .collection('Users')
  //         .add({})
  //         .then((value) => print('Data added'))
  //         .catchError((error) => print('Failed to add data: $error'));
  //     // FirebaseFirestore.instance.collection('Users').doc().
  //     // await users.doc(user!.uid).set({
  //     //   'UUID': user!.uid,
  //     //   'Name': name,
  //     //   'Email': user?.email,
  //     //   'Number': user?.phoneNumber,
  //     //   'Bio': bio,
  //     //   // Add more fields as per your requirement
  //     // });
  //     print('User Details Added');
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => const MainApp()),
  //     );
  //   } catch (e) {
  //     print('Failed to add user details: $e');
  //     // Display an error message to the user or handle it in an appropriate way
  //   }
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
      body:SingleChildScrollView(
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
                    fireBaseUser!.phoneNumber.toString(),
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
                            .doc(fireBaseUser!.uid)
                            .set({
                          'name': userName,
                          'Bio': userBio,
                          'Uuid': fireBaseUser!.uid,
                          'Ph No': fireBaseUser!.phoneNumber
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MainApp()));
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
