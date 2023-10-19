import 'dart:js';

import 'package:flutter/material.dart';
import 'main.dart';

class profilePage extends StatelessWidget {
  const profilePage({super.key});

  @override
  Widget build(BuildContext profile_Page) {
    return Column(
      children: [
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(profile_Page);
              },
            )
          ],
        )
      ],
    );
  }
}
