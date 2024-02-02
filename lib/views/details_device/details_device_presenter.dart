import 'package:flutter/material.dart';
import 'package:smart_home/constants.dart';
import 'package:smart_home/data/models/device.dart';

class DetailDevicePresenter {
  DetailDevicePresenter({
    required this.device,
    required this.reload,
    required this.callback,
  });
  Device device;
  Function reload;
  Function callback;

  IconData getIcon() {
    if (device.name == MyConstants.light) {
      return device.isOn ? MyConstants.iconLightOn : MyConstants.iconLightOff;
    } else if (device.name == MyConstants.fan) {
      return MyConstants.iconFan;
    } else {
      return device.isOn ? MyConstants.iconTiviOn : MyConstants.iconTiviOff;
    }
  }

  onClickChangeValueButton(bool isUp) {
    if (isUp) {
      if (device.value < 10) {
        device.value++;
        if (device.value == 1) {
          device.isOn = true;
        }
      }
    } else {
      if (device.value > 0) {
        device.value--;
        if (device.value == 0) {
          device.isOn = false;
        }
      }
    }
    reload();
  }

  IconData getModeIcon() {
    return MyConstants.iconMode;
  }

  Color getColorIconSchedule() {
    return MyConstants.colorIconDeviceOff;
  }

  onClickModeButton() {}
  onClickOnOffButton() {
    device.isOn = !device.isOn;
    reload();
    callback();
  }

  onClickScheduleButton() {}
}
