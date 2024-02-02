import 'package:flutter/material.dart';
import 'package:smart_home/constants.dart';
import 'package:smart_home/views/details_device/details_device_presenter.dart';
import 'package:smart_home/views/details_device/num_up_down.dart';
import 'package:smart_home/views/details_device/status.dart';

class DeviceInfo extends StatefulWidget {
  const DeviceInfo({super.key, required this.presenter});
  final DetailDevicePresenter presenter;

  @override
  State<DeviceInfo> createState() => _DeviceInfoState();
}

class _DeviceInfoState extends State<DeviceInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width / 1.5,
      height: MediaQuery.of(context).size.height / 2.6,
      decoration: BoxDecoration(
        color: MyConstants.colorBackgroundContainer,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Center(
          child: Column(
        children: [
          Status(isOn: widget.presenter.device.isOn),
          Icon(
            widget.presenter.getIcon(),
            color: widget.presenter.device.isOn
                ? MyConstants.colorIconDeviceOn
                : MyConstants.colorIconDeviceOff,
            size: MediaQuery.of(context).size.height / 3.8,
          ),
          NumUpDown(presenter: widget.presenter),
        ],
      )),
    );
  }
}
