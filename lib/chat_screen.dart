// ignore_for_file: unused_element, non_constant_identifier_names, avoid_print, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:not_whatsapp/profile_page.dart';
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
              child: const Icon(
                Icons.keyboard_voice,
                // color: Color.fromARGB(255, 9, 110, 81),
              ),
            ),
          )
        ],
      ),
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
<<<<<<< HEAD
    return Container();
    // Stack(
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
=======
    return Container(
      padding: const EdgeInsets.all(8.0),
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
                    icon: const Icon(Icons.emoji_emotions_outlined),
                    onPressed: () {},
                  ),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      onSubmitted: _textController.text.isNotEmpty
                          ? _handleSubmitted
                          : null,
                      onChanged: (changedValue) {
                        _inputValue.text = changedValue;
                      },
                      decoration: const InputDecoration(
                        hintText: "Message",
                        border: InputBorder.none,
                        // errorText: _validate ? "Value Can't Be Empty" : null
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
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
                  IconButton(onPressed: () {}, icon: const Icon(Icons.camera_alt)),

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
          const SizedBox(width: 10.0),
          FloatingActionButton(
            onPressed: () {},
            child: IconButton(
                onPressed: () {
                  _textController.text.isEmpty
                      ? print
                      : _handleSubmitted(_textController.text);
                },
                icon: const Icon(Icons.send)),
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
>>>>>>> 37fa6edb5f2a5f366c5162123a02dca2a859457b
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
                const PopupMenuItem(
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
          child: const SizedBox(
            child: Row(
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
            // ignore: avoid_types_as_parameter_names
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext) => const profilePage()) );
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
            child: const CircleAvatar(
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
                    const Text('User',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 18)),
                    Container(
                      margin: const EdgeInsets.only(top: 5.0),
                      child: Text(text,
                          style: const TextStyle(
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
