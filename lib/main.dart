import 'package:flutter/material.dart';
import 'mainui.dart';

// final navigatorsKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: MainApp()));
}

var themeColorGreen = const Color.fromARGB(255, 9, 110, 81);






//enter details

// overlay = showDialog(
//                     builder: ((listViewNumbers) => AlertDialog(
//                             shadowColor: Colors.black45,
//                             backgroundColor: Colors.white,
//                             content: SizedBox(
//                               height:
//                                   MediaQuery.of(listViewNumbers).devicePixelRatio + 95,
//                               child: Column(
//                                 mainAxisSize: MainAxisSize.max,
//                                 children: [
//                                   TextField(
//                                     textAlign: TextAlign.start,
//                                     textInputAction: TextInputAction.next,
//                                     onSubmitted: (name) {
//                                       newPersonDetailsName.add(name);
//                                     },
//                                     decoration: const InputDecoration(
//                                       hintText: 'Enter Name',
//                                     ),
//                                     // onChanged: (value) => ,
//                                   ),
//                                   TextField(
//                                     textAlign: TextAlign.start,
//                                     textInputAction: TextInputAction.go,
//                                     onSubmitted: (email) {
//                                       newPersonDetailsEmail.add(email);
//                                     },
//                                     decoration: const InputDecoration(
//                                       hintText: 'Enter Email',
//                                     ),
//                                     // onChanged: (value) => ,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             actions: [
//                               ElevatedButton(
//                                   style: const ButtonStyle(
//                                     backgroundColor:
//                                         MaterialStatePropertyAll<Color>(
//                                             Color.fromARGB(255, 9, 110, 81)),
//                                   ),
//                                   onPressed: () {
//                                     setState(() {
//                                       newChatDetails.add(listViewNumbers);
//                                       // newPersonDetailsEmail!.add(context);
//                                       // newPersonDetailsName!.add(context);
//                                       // chatNumber++;
//                                       // print(
//                                       //     '$newPersonDetailsName');
//                                       //     print(
//                                       //     '$newPersonDetailsEmail');
//                                     });
//                                     Navigator.of(listViewNumbers).pop(true);
//                                   },
//                                   child: const Icon(Icons.send_rounded))
//                             ])),
//                     context: context);