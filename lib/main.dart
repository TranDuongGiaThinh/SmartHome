import 'package:flutter/material.dart';
import 'package:smart_home/views/home/home_screen.dart';
import 'package:smart_home/views/login/login_screen.dart';

import 'constants.dart';
import 'global/global.dart';
import 'views/notification/noti_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: MyConstants.appName,
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

  @override
  initState() {
    super.initState();

    GlobalData().load().then((value) {
      setState(() {});
    });
  }

  updateSeletectedIndex(int newIndex) {
    if (seletectedIndex != newIndex) {
      seletectedIndex = newIndex;
      setState(() {});
    }
  }

  Widget buildContentSeletected() {
    return seletectedIndex == MyConstants.homeIndex
        ? HomeScreen(callBack: () => setState(() {}))
        : const NotiScreen();
  }

  @override
  Widget build(BuildContext context) {
    if (GlobalData.boardname.isEmpty) {
      return LoginScreen(callBack: () => setState(() {}));
    }

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              seletectedIndex == MyConstants.homeIndex
                  ? MyConstants.home
                  : MyConstants.noti,
              style: const TextStyle(
                  fontSize: MyConstants.fontHeader,
                  color: MyConstants.colorTextWithBackground),
            ),
          ],
        ),
        backgroundColor: MyConstants.colorAppbar,
      ),
      body: buildContentSeletected(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: MyConstants.colorNavbar,
        items: [
          BottomNavigationBarItem(
            icon: Icon(MyConstants.iconHome,
                color: seletectedIndex == MyConstants.homeIndex
                    ? MyConstants.colorContentSelected
                    : MyConstants.colorContentUnselected),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(MyConstants.iconNoti,
                color: seletectedIndex == MyConstants.notiIndex
                    ? MyConstants.colorContentSelected
                    : MyConstants.colorContentUnselected),
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
