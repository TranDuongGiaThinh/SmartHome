import 'package:flutter/material.dart';
import 'package:smart_home/constants.dart';
import 'package:smart_home/data/models/device.dart';
import 'package:smart_home/views/details_device/details_device_presenter.dart';
import 'package:smart_home/views/details_device/device_info.dart';
import 'package:smart_home/views/details_device/list_button.dart';
import 'package:smart_home/views/logo/logo.dart';

class DetailDeviceScreen extends StatefulWidget {
  const DetailDeviceScreen({
    super.key,
    required this.device,
    required this.callBack,
  });
  final Device device;
  final Function callBack;

  @override
  State<DetailDeviceScreen> createState() => _DetailDeviceScreenState();
}

class _DetailDeviceScreenState extends State<DetailDeviceScreen> {
  DetailDevicePresenter? presenter;

  @override
  void initState() {
    super.initState();

    presenter = DetailDevicePresenter(
      device: widget.device,
      reload: () => setState(() {}),
      callback: widget.callBack,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    presenter!.device.name,
                    style: const TextStyle(
                      fontSize: MyConstants.fontHeader,
                      color: MyConstants.colorTextWithBackground,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.abc,
              color: MyConstants.colorAppbar,
            ),
          ],
        ),
        backgroundColor: MyConstants.colorAppbar,
      ),
      body: presenter == null
          ? Column(
              children: const [Logo()],
            )
          : Container(
              margin: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width - 20,
              color: MyConstants.colorBackgroundApp,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DeviceInfo(presenter: presenter!),
                  ListButton(presenter: presenter!)
                ],
              ),
            ),
    );
  }
}
