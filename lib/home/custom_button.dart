import 'package:flutter/material.dart';
import 'package:smart_home/constants.dart';
import 'package:smart_home/home/device_presenter.dart';
import 'package:smart_home/models/device.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, required this.device, required this.presenter});
  final Device device;
  final DevicePresenter presenter;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 40, right: 40),
      margin: const EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: MyConstants.colorButton),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  presenter.getIconOfDevice(device),
                  color: device.isOn
                      ? MyConstants.colorIconDeviceOn
                      : MyConstants.colorIconDevicetOff,
                ),
                Text(
                  device.isOn
                      ? "${device.name} (${MyConstants.on})"
                      : device.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MyConstants.fontHeader,
                      color: MyConstants.colorText),
                ),
                IconButton(
                  onPressed: () => presenter.onClickButtonOnOff(device),
                  icon: Icon(
                    Icons.power_settings_new,
                    color: device.isOn
                        ? MyConstants.colorIconPowerOn
                        : MyConstants.colorIconDevicetOff,
                  ),
                )
              ],
            ),
          ]),
    );
  }
}
