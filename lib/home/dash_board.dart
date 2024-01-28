import 'package:flutter/material.dart';
import 'package:smart_home/constants.dart';
import 'package:smart_home/home/device_presenter.dart';
import 'package:smart_home/home/gauge.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key, required this.presenter});
  final DevicePresenter presenter;

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 5),
        width: MediaQuery.of(context).size.width - 20,
        height: MediaQuery.of(context).size.height /2.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: MyConstants.colorBackgroundContainer,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                Container(),
                Guage(
                  name: MyConstants.guageCelsius,
                  value: 25,
                  icon: Icons.thermostat,
                  unit: MyConstants.unitCelsius,
                  height: MediaQuery.of(context).size.height / 7,
                  presenter: widget.presenter,
                ),
                Guage(
                  name: MyConstants.guageHumidity,
                  value: 40,
                  icon: Icons.water_drop_outlined,
                  unit: MyConstants.unitPercent,
                  height: MediaQuery.of(context).size.height / 7,
                  presenter: widget.presenter,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Guage(
                  name: MyConstants.guageUsage,
                  value: widget.presenter.getUsageRate(),
                  icon: Icons.power_settings_new_rounded,
                  unit: MyConstants.unitPercent,
                  height: MediaQuery.of(context).size.height / 3,
                  presenter: widget.presenter,
                ),
              ],
            ),
          ],
        ));
  }
}
