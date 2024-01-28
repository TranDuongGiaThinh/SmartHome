import 'package:flutter/material.dart';
import 'package:smart_home/constants.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: MyConstants.colorBackgroundApp,
        child: Image.asset(MyConstants.logo, fit: BoxFit.fill),
      ),
    );
  }
}