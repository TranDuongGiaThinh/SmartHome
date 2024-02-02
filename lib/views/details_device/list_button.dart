import 'package:flutter/material.dart';
import 'package:smart_home/constants.dart';
import 'package:smart_home/views/details_device/botton_in_details.dart';
import 'package:smart_home/views/details_device/details_device_presenter.dart';

class ListButton extends StatelessWidget {
  const ListButton({super.key, required this.presenter});
  final DetailDevicePresenter presenter;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BottonInDetails(
            onClick: presenter.onClickModeButton,
            icon: MyConstants.iconMode,
            colorIcon: MyConstants.colorIcon,
          ),
          BottonInDetails(
            onClick: presenter.onClickOnOffButton,
            icon: MyConstants.iconPower,
            colorIcon: presenter.device.isOn
                ? MyConstants.colorIconPowerOn
                : MyConstants.colorIconPowerOff,
          ),
          BottonInDetails(
            onClick: presenter.onClickScheduleButton,
            icon: MyConstants.iconSchedule,
            colorIcon: presenter.getColorIconSchedule(),
          ),
        ],
      ),
    );
  }
}
