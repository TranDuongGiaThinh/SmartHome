import 'package:flutter/material.dart';
import 'package:smart_home/constants.dart';
import 'package:smart_home/home/device_presenter.dart';

class Guage extends StatelessWidget {
  const Guage({
    super.key,
    required this.name,
    required this.value,
    required this.icon,
    required this.unit,
    required this.height,
    required this.presenter,
  });
  final String name;
  final int value;
  final IconData icon;
  final String unit;
  final double height;
  final DevicePresenter presenter;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          height: height,
          width: height,
          decoration: BoxDecoration(
            color: presenter.getColorUsageRate(name),
            shape: BoxShape.circle,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              name == MyConstants.guageUsage
                  ? GestureDetector(
                      onTap:()=> presenter.onClickButtonTurnOffAll(context),
                      child: Icon(
                        icon,
                        size: height / 3,
                        color: presenter.getUsageRate() > 0
                            ? MyConstants.colorIconPowerOn
                            : MyConstants.colorIcon,
                      ),
                    )
                  : Icon(
                      icon,
                      size: height / 3,
                      color: MyConstants.colorIcon,
                    ),
              Text(
                "$value $unit",
                style: TextStyle(
                  fontSize: name == MyConstants.guageUsage
                      ? MyConstants.fontHeader * 2.5
                      : MyConstants.fontHeader,
                  color: MyConstants.colorText,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        Text(
          name,
          style: const TextStyle(
            fontSize: MyConstants.fontHeader,
            color: MyConstants.colorText,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
