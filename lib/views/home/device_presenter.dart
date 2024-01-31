import 'package:flutter/material.dart';
import 'package:smart_home/data/repositories/data_local_repository.dart';
import 'package:smart_home/global/global.dart';
import 'package:smart_home/views/confirm_dialog/confirm_dialog.dart';
import 'package:smart_home/data/models/device.dart';

import '../../constants.dart';

class DevicePresenter {
  DevicePresenter({required this.devices, required this.reload});
  List<Device> devices;
  Function reload;

  static Future<List<Device>> getDevices() async {
    return [
      Device(id: "0", name: MyConstants.light, isOn: false, value: 0),
      Device(id: "1", name: MyConstants.fan, isOn: false, value: 0),
      Device(id: "2", name: MyConstants.tivi, isOn: false, value: 0),
    ];
  }

  onClickButtonTurnOffAll(BuildContext context) {
    if (getUsageRate() > 0) {
      ConfirmationDialog.show(
              context: context,
              title: MyConstants.confirm,
              content: MyConstants.contentConfirmTurnOffAll)
          .then((value) {
        if (value) {
          //sv
          for (int i = 0; i < devices.length; i++) {
            devices[i].isOn = false;
          }
          reload();
        }
      });
    }
  }

  onClickButtonOnOff(Device device) {
    //sv
    device.isOn = !device.isOn;
    reload();
  }

  IconData getIconOfDevice(Device device) {
    if (device.name == MyConstants.light) {
      return device.isOn ? Icons.lightbulb : Icons.lightbulb_outline;
    } else if (device.name == MyConstants.fan) {
      return Icons.cyclone;
    } else {
      return device.isOn ? Icons.tv : Icons.tv_off;
    }
  }

  int getUsageRate() {
    if (devices.isEmpty) {
      return 0;
    }

    int onDevices = devices.where((device) => device.isOn).length;
    return (onDevices / devices.length * 100).toInt();
  }

  Color getColorUsageRate(String guageName) {
    int rate = getUsageRate();

    if (guageName != MyConstants.guageUsage) {
      return MyConstants.colorGuage;
    }

    if (rate <= 20) {
      return MyConstants.colorGuage20Percent;
    } else if (rate <= 35) {
      return MyConstants.colorGuage35Percent;
    } else if (rate <= 50) {
      return MyConstants.colorGuage50Percent;
    } else if (rate <= 65) {
      return MyConstants.colorGuage65Percent;
    } else if (rate <= 80) {
      return MyConstants.colorGuage80Percent;
    } else {
      return MyConstants.colorGuage100Percent;
    }
  }

  exitBoard(Function callBack) {
    GlobalData().clear().then((value) {
      callBack();
    });
  }
}
