import 'package:flutter/material.dart';

class NumUpDown extends StatefulWidget {
  const NumUpDown({super.key, required this.value});
  final int value;

  @override
  State<NumUpDown> createState() => _NumUpDownState();
}

class _NumUpDownState extends State<NumUpDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("updown"),
    );
  }
}
