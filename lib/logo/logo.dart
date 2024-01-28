import 'package:flutter/material.dart';
import 'package:smart_home/constants.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: MyConstants.appBackground,
        child: Image.asset("data/logo.png", fit: BoxFit.fill),
      ),
    );
  }
}