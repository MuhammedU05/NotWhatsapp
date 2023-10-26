import 'package:flutter/material.dart';
import 'main.dart';

class Settingpage extends StatefulWidget {
  final String? name; // Add the name parameter

  const Settingpage({Key? key, this.name}) : super(key: key);

  @override
  State<Settingpage> createState() => _SettingpageState();
}

class _SettingpageState extends State<Settingpage> {
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
                  child: Text(widget.name ?? "Default Name"), // Display the user's name
                ),
              ),
              title: Text("Name"),
              subtitle: Text(widget.name ?? "Default Name"),
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
          ],
        ),
      ),
    );
  }
}
