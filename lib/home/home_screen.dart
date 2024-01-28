import 'package:flutter/material.dart';
import 'package:smart_home/home/custom_button.dart';
import 'package:smart_home/home/dash_board.dart';
import 'package:smart_home/home/device_presenter.dart';
import 'package:smart_home/logo/logo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DevicePresenter? presenter;

  @override
  void initState() {
    super.initState();

    DevicePresenter.getDevices().then((value) {
      presenter =
          DevicePresenter(devices: value, reload: () => setState(() {}));
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
      child: Column(
        children: [
          const Dashboard(),
          for (int i = 0; i < presenter!.devices.length; i++)
            CustomButton(
              device: presenter!.devices[i],
              presenter: presenter!,
            )
        ],
      ),
    );
  }
}
