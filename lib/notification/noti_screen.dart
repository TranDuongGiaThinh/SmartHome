import 'package:flutter/material.dart';

import '../constants.dart';

class NotiScreen extends StatefulWidget {
  const NotiScreen({super.key});

  @override
  State<NotiScreen> createState() => _NotiScreenState();
}

class _NotiScreenState extends State<NotiScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: const [
        Text(
          "tbbbbbbbbbbb",
          style: TextStyle(
              fontSize: MyConstants.fontText, color: MyConstants.colorText),
        )
      ],
    );
  }
}
