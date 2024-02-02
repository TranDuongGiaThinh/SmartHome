import 'package:flutter/material.dart';
import 'package:smart_home/constants.dart';
import 'package:smart_home/global/global.dart';
import 'package:smart_home/views/home/device_presenter.dart';
import 'package:smart_home/views/home/gauge.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key, required this.presenter, required this.callBack});
  final DevicePresenter presenter;
  final Function callBack;

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(bottom: 10, left: 10),
        margin: const EdgeInsets.only(bottom: 5),
        width: MediaQuery.of(context).size.width - 20,
        height: MediaQuery.of(context).size.height / 2.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: MyConstants.colorBackgroundContainer,
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 20, right: 10),
              width: MediaQuery.of(context).size.height - 20,
              child: Row(
                children: [
                  const Icon(
                    MyConstants.iconPerson,
                    color: MyConstants.colorIcon,
                  ),
                  Text(
                    GlobalData.username.toUpperCase(),
                    style: const TextStyle(
                      fontSize: MyConstants.fontHeader - 1,
                      color: MyConstants.colorText,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    GlobalData.boardname.toUpperCase(),
                    style: const TextStyle(
                      fontSize: MyConstants.fontHeader - 1,
                      color: MyConstants.colorText,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () =>
                        widget.presenter.exitBoard(context, widget.callBack),
                    icon: const Icon(
                      MyConstants.iconLogout,
                      color: MyConstants.colorIcon,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(),
                    Guage(
                      name: MyConstants.guageCelsius,
                      value: 25,
                      icon: MyConstants.iconCelsius,
                      unit: MyConstants.unitCelsius,
                      height: MediaQuery.of(context).size.height / 7,
                      presenter: widget.presenter,
                    ),
                    Guage(
                      name: MyConstants.guageHumidity,
                      value: 40,
                      icon: MyConstants.iconHumidity,
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
                      height: MediaQuery.of(context).size.height / 3.3,
                      presenter: widget.presenter,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ));
  }
}
