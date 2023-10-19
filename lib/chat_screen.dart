// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'main.dart';
import './Settingspage.dart';

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
  const ChatScreen({super.key});

  @override
  State createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _inputValue = TextEditingController();
  bool _isHintTextVisible = true;
  final FocusNode _focusNode = FocusNode();

  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message = ChatMessage(
      text: text,
    );
    setState(() {
      _messages.insert(0, message);
    });
  }

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isHintTextVisible =
            _textController.text.isEmpty && _focusNode.hasFocus;
        _isHintTextVisible == false ? print('Changed') : print('Changed 2');
      });
    });
  }

  Widget _buildTextComposer() {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.emoji_emotions_outlined),
                    onPressed: () {},
                  ),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      onSubmitted: _textController.text.isNotEmpty
                          ? _handleSubmitted
                          : null,
                      onChanged: (changedValue) {
                        _inputValue.text = changedValue;
                      },
                      decoration: InputDecoration(
                        hintText: "Message",
                        border: InputBorder.none,
                        // errorText: _validate ? "Value Can't Be Empty" : null
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.attach_file,
                      color: Colors.black54,
                    ),
                    onPressed: () {},
                  ),
                  // IconButton(
                  //   icon: Icon(
                  //     Icons.attach_file,
                  //     color: Colors.black54,
                  //   ),
                  //   onPressed: () {},
                  // ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.camera_alt)),

                  // IconButton(onPressed: (){
                  //   _textController.text.isEmpty
                  //         ? print
                  //         : _handleSubmitted(_textController.text);
                  // },
                  // icon: Icon(Icons.send)
                  // )
                ],
              ),
            ),
          ),
          SizedBox(width: 10.0),
          FloatingActionButton(
            onPressed: () {},
            child: IconButton(
                onPressed: () {
                  _textController.text.isEmpty
                      ? print
                      : _handleSubmitted(_textController.text);
                },
                icon: Icon(Icons.send)),
            backgroundColor: themeColorGreen,
          ),
          // FloatingActionButton(
          //   onPressed: () {},
          //   child: IconButton(
          //       onPressed: () {
          //         // voice recorder function
          //       },
          //       icon: Icon(Icons.keyboard_voice)),
          //   backgroundColor: themeColorGreen,
          // ),
        ],
      ),
    );
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
                PopupMenuItem(
                  child: Text('Settings'),
                
                ),
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
          child: SizedBox(
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
          ),
          onTap: () {
            print('Profile');
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext) => profilePage()) );
          },
        ),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
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

// Show(bool isHintTextVisible) {
//   print(isHintTextVisible);
// }

class ChatMessage extends StatelessWidget {
  const ChatMessage({super.key, required this.text});
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
