import 'package:flutter/material.dart';
import 'package:not_whatsapp/Not%20Mycode/constants.dart';
import 'package:not_whatsapp/Not%20Mycode/dummy_data.dart';
import 'package:not_whatsapp/Not%20Mycode/participate_tile.dart';
import 'package:not_whatsapp/Not%20Mycode/utils.dart';

class ConversationList extends StatelessWidget {
  const ConversationList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ArchiveTile(),
        Expanded(
          child: ListView.separated(
              padding: EdgeInsets.symmetric(
                  horizontal: Utils.kDefaultSpace / 2, vertical: 0),
              itemCount: KDummyData.chatsList.length,
              separatorBuilder: (c, i) => Utils.verticalSpace(10),
              itemBuilder: ((context, index) {
                final element = KDummyData.chatsList[index];
                return ParticipateTile(element: element);
              })),
        ),
      ],
    );
  }
}

class ArchiveTile extends StatelessWidget {
  const ArchiveTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(
        horizontal: Utils.kDefaultSpace,
        vertical: Utils.kDefaultSpace / 2,
      ),
      leading: Icon(
        Icons.archive_outlined,
        color: primaryColor,
      ),
      title: Text(
        "Archived",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
      trailing: Text(
        "5",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: primaryColor,
        ),
      ),
    );
  }
}
