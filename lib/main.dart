import 'package:flutter/material.dart';
import 'package:smart_home/home/home_screen.dart';

import 'constants.dart';
import 'notification/noti_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SmarrtHome',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int seletectedIndex = MyConstants.homeIndex;

  updateSeletectedIndex(int newIndex) {
    if (seletectedIndex != newIndex) {
      seletectedIndex = newIndex;
      setState(() {});
    }
  }

  Widget buildContentSeletected() {
    return seletectedIndex == MyConstants.homeIndex
        ? const HomeScreen()
        : const NotiScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(seletectedIndex == MyConstants.homeIndex
              ? MyConstants.home
              : MyConstants.noti)),
      body: buildContentSeletected(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,
                color: seletectedIndex == MyConstants.homeIndex
                    ? Colors.blue
                    : Colors.black),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_active,
                color: seletectedIndex == MyConstants.notiIndex
                    ? Colors.blue
                    : Colors.black),
            label: "",
          ),
        ],
        onTap: (newIndex) {
          updateSeletectedIndex(newIndex);
        },
      ),
    );
  }
}
