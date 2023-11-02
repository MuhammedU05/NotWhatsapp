import 'package:flutter/material.dart';
import 'package:not_whatsapp/Not%20Mycode/channels_list.dart';
import 'package:not_whatsapp/Not%20Mycode/constants.dart';
import 'package:not_whatsapp/Not%20Mycode/status_horizontal.dart';

class UpdatesPage extends StatelessWidget {
  const UpdatesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          StatusHorizontal(),
          Divider(color: subTitleTextColor),
          ChannelsList(),
        ],
      ),
    );
  }
}
