import 'package:flutter/material.dart';
import 'package:smart_home/notification/noti_presenter.dart';
import '../constants.dart';
import '../logo/logo.dart';
import 'noti_card.dart';

class NotiScreen extends StatefulWidget {
  const NotiScreen({super.key});

  @override
  State<NotiScreen> createState() => _NotiScreenState();
}

class _NotiScreenState extends State<NotiScreen> {
  
  NotiPresenter? presenter;

  @override
  void initState() {
    super.initState();

    NotiPresenter.getAllNotifications().then((value) {
      presenter =
          NotiPresenter(notifications: value, reload: () => setState(() {}));
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (presenter == null) {
      return Column(
        children: const [
          Logo(),
        ],
      );
    }
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: ListView(
        children: [
          for (int i = 0; i < presenter!.notifications.length; i++)
            NotiCard(
              noti: presenter!.notifications[i],
              presenter: presenter!,
            ),
        ],
      ),
    );
  }
}
