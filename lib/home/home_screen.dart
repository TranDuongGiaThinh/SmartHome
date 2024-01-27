import 'package:flutter/material.dart';
import 'package:smart_home/home/custom_button.dart';
import 'package:smart_home/home/device_presenter.dart';

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
      return Container();
    }
    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        for (int i = 0; i < presenter!.devices.length; i++)
          CustomButton(
            device: presenter!.devices[i],
            presenter: presenter!,
          )
      ],
    );
  }
}
