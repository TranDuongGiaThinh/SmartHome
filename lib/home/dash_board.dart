import 'package:flutter/material.dart';
import 'package:smart_home/constants.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        width: MediaQuery.of(context).size.width - 20,
        color: MyConstants.appBackground,
        child: const Text("dashboard"),
      ),
    );
  }
}
