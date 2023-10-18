import 'package:flutter/material.dart';
import 'main.dart';

// ignore: camel_case_types
class myChatScreen extends StatefulWidget {
  const myChatScreen({super.key});

  @override
  State<myChatScreen> createState() => _myChatScreenState();
}

// ignore: camel_case_types
class _myChatScreenState extends State<myChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        toolbarHeight: 70,
        backgroundColor: themeColorGreen,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.videocam,
              size: 30,
            ),
            padding: const EdgeInsets.all(15),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.call,
              size: 30,
            ),
            padding: const EdgeInsets.all(15),
          ),
          PopupMenuButton(
            iconSize: 35,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            itemBuilder: (context) {
              return [
                // const PopupMenuItem(child: Text('New Group')),
                // const PopupMenuItem(child: Text('New Broadcast')),
                // const PopupMenuItem(child: Text('Linked Devices')),
                // const PopupMenuItem(child: Text('Starred Messages')),
                const PopupMenuItem(child: Text('Settings')),
              ];
            },
          ),
        ],
        leading: Row(
          children: [
            IconButton(
                splashRadius: 30,
                alignment: Alignment.center,
                // padding: EdgeInsets.all(1),
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back)),
          ],
        ),
        title: GestureDetector(
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.red,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Name', style: TextStyle(fontSize: 25)),
                    Text(
                      'Online',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              )
            ],
          ),
          onTap: () {
            print('Profile');
          },
        ),
      ),
      body: Container(),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: themeColorGreen,
              child: Icon(
                Icons.keyboard_voice,
                // color: Color.fromARGB(255, 9, 110, 81),
              ),
            ),
          )
        ],
      ),
      // bottomNavigationBar: SizedBox(
      //   width: MediaQuery.of(context).devicePixelRatio-,
      //   child: Column(
      //     children: [
      //       Row(
      //         children: [
      //           IconButton(icon: Icon(Icons.attach_file),onPressed: () {

      //           },),
      //           TextField(
      //             decoration: InputDecoration(
      //             ),
      //           ),
      //           IconButton(icon: Icon(Icons.photo_camera),onPressed: () {

      //           },),
      //         ],
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  State createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = TextEditingController();

  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message = ChatMessage(
      text: text,
    );
    setState(() {
      _messages.insert(0, message);
    });
  }

  Widget _buildTextComposer() {
    return Container();
    // return Stack(
    //   alignment: Alignment.topCenter,
    //   clipBehavior: Clip.antiAlias,
    //   children: <Widget>[
    //     Container(
    //       alignment: Alignment.bottomCenter,
    //       margin: const EdgeInsets.only(top: 60),
    //       child: Container(
    //         margin: const EdgeInsets.only(top: 60),
    //         constraints: const BoxConstraints(
    //           minHeight: 70,
    //           maxHeight: 78,
    //         ),
    //         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
    //         decoration: const BoxDecoration(
    //           color: Color(0xFF4A78FF),
    //           border: Border(
    //             top: BorderSide(
    //               color: Colors.black87,
    //             ),
    //           ),
    //         ),
    //         child: Align(
    //           alignment: Alignment.bottomCenter,
    //           child: Row(
    //             children: <Widget>[
    //               Expanded(
    //                 child: TextField(
    //                     textAlign: TextAlign.justify,
    //                     textAlignVertical: TextAlignVertical.top,
    //                     keyboardType: TextInputType.text,
    //                     // minLines: 1,
    //                     maxLines: null,
    //                     style: GoogleFonts.alegreya(
    //                       fontSize: 20,
    //                       fontWeight: FontWeight.w600,
    //                       color: Colors.black,
    //                     ),
    //                     controller: _textController,
    //                     decoration: InputDecoration(
    //                       filled: true,
    //                       fillColor: Colors.black12,
    //                       border: OutlineInputBorder(
    //                         borderSide: const BorderSide(
    //                           width: 2,
    //                         ),
    //                         borderRadius: BorderRadius.circular(50),
    //                       ),
    //                     ),
    //                     onChanged: (String value) {
    //                       if (_textController.text != '') {
    //                         setState(() {
    //                           writeMessage = false;
    //                         });
    //                       } else {
    //                         setState(() {
    //                           writeMessage = true;
    //                         });
    //                       }
    //                     }),
    //               ),
    //               IconButton(
    //                   alignment: Alignment.topCenter,
    //                   padding: const EdgeInsets.only(bottom: 30),
    //                   onPressed: () {
    //                     addMessages(true);
    //                     FocusScope.of(context).requestFocus(FocusNode());
    //                     scrollController.animateTo(
    //                       scrollController.position.maxScrollExtent,
    //                       curve: Curves.easeOut,
    //                       duration: const Duration(milliseconds: 300),
    //                     );
    //                   },
    //                   icon: writeMessage
    //                       ? const Icon(
    //                           Icons.insert_photo,
    //                           color: Colors.black87,
    //                           size: 37,
    //                         )
    //                       : const Icon(
    //                           Icons.send,
    //                           color: Colors.black87,
    //                           size: 37,
    //                         )),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ),
    //   ],
    // );

    // Container(
    //     decoration: BoxDecoration(
    //       color: Colors.black12,
    //       borderRadius: BorderRadius.circular(20)
    //     ),
    //     margin: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8.0),
    //     child: Row(
    //       children: <Widget>[
    //         IconButton(
    //           splashRadius: 25,
    //           color: themeColorGreen,
    //           onPressed: (){

    //           },
    //           icon: Icon(Icons.mood)
    //           ),
    //         Flexible(
    //           child: SizedBox(
    //             child: TextField(
    //               controller: _textController,
    //               onSubmitted: _handleSubmitted,
    //               decoration: InputDecoration.collapsed(hintText: "Message",),
    //             ),
    //           ),
    //         ),
    //         IconButton(
    //           color: themeColorGreen,
    //           splashRadius: 0.2,
    //           icon: Icon(Icons.send),
    //           onPressed: () => _handleSubmitted(_textController.text)
    //         ),
    //       ],
    //     ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        toolbarHeight: 70,
        backgroundColor: themeColorGreen,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.videocam,
              size: 30,
            ),
            padding: const EdgeInsets.all(15),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.call,
              size: 30,
            ),
            padding: const EdgeInsets.all(15),
          ),
          PopupMenuButton(
            iconSize: 35,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            itemBuilder: (context) {
              return [
                // const PopupMenuItem(child: Text('New Group')),
                // const PopupMenuItem(child: Text('New Broadcast')),
                // const PopupMenuItem(child: Text('Linked Devices')),
                // const PopupMenuItem(child: Text('Starred Messages')),
                const PopupMenuItem(child: Text('Settings')),
              ];
            },
          ),
        ],
        leading: Row(
          children: [
            IconButton(
                splashRadius: 30,
                alignment: Alignment.center,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back)),
          ],
        ),
        title: GestureDetector(
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.red,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Name', style: TextStyle(fontSize: 25)),
                    Text(
                      'Online',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              )
            ],
          ),
          onTap: () {
            print('Profile');
          },
        ),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
            ),
          ),
          const Divider(height: 1.0),
          _buildTextComposer(),
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  ChatMessage({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
                child: Text('Me', style: TextStyle(color: Colors.white)),
                backgroundColor: Colors.black),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: themeColorGreen,
                border: Border.all(width: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('User',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 18)),
                    Container(
                      margin: const EdgeInsets.only(top: 5.0),
                      child: Text(text,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 15)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
