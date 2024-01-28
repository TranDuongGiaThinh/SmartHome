import 'package:flutter/material.dart';
import 'package:smart_home/models/device.dart';

import '../constants.dart';

class DevicePresenter {
  DevicePresenter({required this.devices, required this.reload});
  List<Device> devices;
  Function reload;

  static Future<List<Device>> getDevices() async {
    return [
      Device(id: 0, name: MyConstants.light, isOn: false),
      Device(id: 1, name: MyConstants.fan, isOn: false),
      Device(id: 2, name: MyConstants.tivi, isOn: false),
    ];
  }

  onClickButtonOnOff(Device device) {
    //sv
    device.isOn = !device.isOn;
    reload();
  }

  IconData getIconOfDevice(Device device){
    if(device.name == MyConstants.light) {
      return device.isOn ? Icons.lightbulb : Icons.lightbulb_outline;
    } else if(device.name == MyConstants.fan) {
      return Icons.cyclone;
    } else {
      return device.isOn ? Icons.tv : Icons.tv_off;
    }
  }
}
