// ignore_for_file: avoid_print

// import 'package:auto_size_text/auto_size_text.dart';
import 'package:not_whatsapp/Settingspage.dart';
import 'package:not_whatsapp/createnewaccount.dart';
// import 'package:not_whatsapp/profilepicpage.dart';
import 'main.dart';
import 'package:flutter/material.dart';
import 'chat_screen.dart';

int addChatMessage = 0;
int number = 0;

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            toolbarHeight: 90,
            leadingWidth: 500,
            backgroundColor: themeColorGreen,
            shadowColor: Colors.transparent,
            elevation: 0,
            leading: const Padding(
              padding: EdgeInsets.only(
                left: 15,
                top: 30,
              ),
              child: Text(
                'Not WhatsApp',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                      padding: const EdgeInsets.only(left: 90),
                      child: IconButton(
                        iconSize: 35,
                        onPressed: () {},
                        icon: const Icon(Icons.search),
                        color: Colors.white,
                      )),
                  PopupMenuButton(
                    iconSize: 35,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    itemBuilder: (context) {
                      return [
                        // In this case, we need 5 popupmenuItems one for each option.
                        const PopupMenuItem(child: Text('New Group')),
                        // const PopupMenuItem(child: Text('New Broadcast')),
                        // const PopupMenuItem(child: Text('Linked Devices')),
                        // const PopupMenuItem(child: Text('Starred Messages')),
                        PopupMenuItem(
                          child: const Text('Settings'),
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => const Settingpage())),
                        ),
                      ];
                    },
                  ),
                ],
              )
            ],
            bottom: TabBar(
              indicatorColor: Colors.green,
              indicatorWeight: 4,
              tabAlignment: TabAlignment.fill,
              // controller: ,
              tabs: [
                Tab(
                    child: IconButton(
                  icon: const Icon(Icons.camera_alt,
                  color: Color.fromRGBO(255, 255, 255, 1),
                  size: 35,),
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const Profilepicpage()
                    //         ),
                    //         );
                  },
                ),),
                const Tab(
                    child: Text(
                  'CHATS',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Color.fromRGBO(255, 255, 255, 1)),
                  maxLines: 1,
                )),
                const Tab(
                    child: Text(
                  'STATUS',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 19,
                      color: Color.fromRGBO(255, 255, 255, 1)),
                  maxLines: 1,
                )),
                const Tab(
                    child: Text(
                  'CALLS',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Color.fromRGBO(255, 255, 255, 1)),
                  maxLines: 1,
                )),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              const Text('Camera Coming Soon'),
              chatNumber == 0
                  ? const Text('No Chats Here Yet')
                  : Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                              itemCount: chatNumber,
                              shrinkWrap: true,
                              itemBuilder:
                                  // ignore: non_constant_identifier_names
                                  (BuildContext BuildContextcontext, context) {
                                return Column(
                                  children: [
                                    ListTile(
                                      tileColor: Colors.transparent,
                                      // title: Text('${newChatDetails[chatNumber]}'),
                                      leading: const CircleAvatar(
                                        backgroundColor: Colors.red,
                                      ),
                                      title: Text(
                                        'Name $context',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 24),
                                      ),
                                      subtitle: const Text(
                                        'Email',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18),
                                      ),
                                      trailing: const Column(
                                        children: [
                                          Icon(
                                            Icons.circle_notifications,
                                            color: Colors.green,
                                            size: 30,
                                          ),
                                        ],
                                      ),
                                      onTap: () {
                                        Navigator.push(
                                            BuildContextcontext,
                                            MaterialPageRoute(
                                                // ignore: non_constant_identifier_names
                                                builder:
                                                    // ignore: non_constant_identifier_names
                                                    (BuildContextContext) =>
                                                        // const myChatScreen()
                                                        const ChatScreen()));
                                      },
                                    ),
                                  ],
                                );
                              }),
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.end,
                        //   crossAxisAlignment: CrossAxisAlignment.end,
                        //   children: [
                        //     Container(
                        //       padding: const EdgeInsets.all(10),
                        //       alignment: Alignment.bottomRight,
                        //       child: FloatingActionButton(
                        //                 elevation: 10,
                        //                 backgroundColor: const Color.fromARGB(255, 9, 110, 81),
                        //                 onPressed: () {
                        //                   setState(() {
                        //                     chatNumber++;
                        //                     const deatailsEntering();
                        //                   });
                        //                 },
                        //                 child: const Icon(Icons.message, color: Color.fromRGBO(255, 255, 255, 1)),
                        //               ),
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
              // const Text('Status coming soon'),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const createnewaccount())));
                  },
                  icon: const Icon(Icons.abc)),
              const Text('Calls coming soon')

              // ChatList(),
              // chatListView(),
              // deatailsEntering(),
            ],
          ),
          // chatListView(),
          // deatailsEntering(),
          floatingActionButton: FloatingActionButton(
            elevation: 10,
            backgroundColor: const Color.fromARGB(255, 9, 110, 81),
            onPressed: () {
              setState(() {
                chatNumber++;
                // const deatailsEntering();
                // ChatScreen();
              });
            },
            child: const Icon(Icons.message,
                color: Color.fromRGBO(255, 255, 255, 1)),
          )),
    );
  }
}

// ignore: prefer_typing_uninitialized_variables
// var overlay;
// var listViewNumbers;
int chatNumber = 0;
// ignore: prefer_typing_uninitialized_variables
var mychatscreencontext;

// List newChatDetails = [];
// List newPersonDetailsName = [];
// List newPersonDetailsEmail = [];

// ignore: camel_case_types
class deatailsEntering extends MaterialApp {
  const deatailsEntering({super.key});

  // ignore: non_constant_identifier_names
  Widget Build(BuildContext context) {
    return Container(
        alignment: Alignment.centerRight,
        child: SizedBox(
          width: 100,
          height: 200,
          child: Container(
            color: Colors.green.shade800,
          ),
        ));
  }
}

var hour = DateTime.now().hour.toString();
var minute = DateTime.now().minute.toString();
// var timeNow = '$hour:$minute';
// var Name = newChatDetails[chatNumber];

// ignore: camel_case_types
class newPersonDetails {
  final String namePerson;
  final String emailPerson;

  newPersonDetails(this.namePerson, this.emailPerson);
}
