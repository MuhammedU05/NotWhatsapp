import 'package:flutter/material.dart';

class Settingpage extends StatefulWidget {
  const Settingpage({super.key});

  @override
  State<Settingpage> createState() => _SettingpageState();
}

class _SettingpageState extends State<Settingpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 5, 68, 7),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Settings"),
            IconButton(
              iconSize: 35,
              onPressed: () {},
              icon: const Icon(Icons.search),
              color: Colors.white,
            )
          ],
        ),
      ),
      body:  SingleChildScrollView(child:  Column(
        children: <Widget>[
          ListTile(leading: Padding(
            padding: EdgeInsets.only(right: 23),
            child: CircleAvatar(radius: 60,)
          ),
          title: Text("Captian Marval"),
          subtitle: Text("hello"),
           
            
          ),
          ListTile(
            onTap: (){
              
            },
            leading: Icon(
              Icons.key,
              size: 35,
            ),
            title: Text(
              'Account',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            subtitle: Text("Security notifications,change number"),
          ),
           ListTile(
            onTap: (){
              
            },
            leading: Icon(
              Icons.contact_mail,
              size: 35,
            ),
            title: Text(
              'Privacy',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            subtitle: Text("Block contacts,disappearing messages"),
          ), ListTile(
            onTap: (){
              
            },
            leading: Icon(
              Icons.face,
              size: 35,
            ),
            title: Text(
              'Avatar',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            subtitle: Text("Create,edit,profile photo"),
          ), ListTile(
            onTap: (){
              
            },
            leading: Icon(
              Icons.chat,
              size: 35,
            ),
            title: Text(
              'Chats',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            subtitle: Text("Theme,wallpapers,chat history"),
          ), ListTile(
            onTap: (){
              
            },
            leading: Icon(
              Icons.notifications,
              size: 35,
            ),
            title: Text(
              'Notifications',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            subtitle: Text("Message,group & call tones"),
          ), ListTile(
            onTap: (){
              
            },
            leading: Icon(
              Icons.storage,
              size: 35,
            ),
            title: Text(
              'Storage and data',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            subtitle: Text("Network usage,auto-download"),
          ), ListTile(
            onTap: (){

            },
            leading: Icon(
              Icons.language,
              size: 35,
            ),
            title: Text(
              'App language',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            subtitle: Text("English(device's language)"),
          ), ListTile(
            leading: Icon(
              Icons.help,
              size: 35,
            ),
            title: Text(
              'Help',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            subtitle: Text("Help center,contact us,privacy policy"),
          ), ListTile(
            leading: Icon(
              Icons.inventory_2_outlined,
              size: 35,
            ),
            title: Text(
              'Invite a friend',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            
          ),
        ],
      ),
      ),
        
      

    );
  }
}
