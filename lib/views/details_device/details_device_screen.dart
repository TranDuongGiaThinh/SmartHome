import 'package:flutter/material.dart';
import 'package:smart_home/constants.dart';
import 'package:smart_home/data/models/device.dart';
import 'package:smart_home/views/details_device/details_device_presenter.dart';
import 'package:smart_home/views/details_device/device_info.dart';
import 'package:smart_home/views/details_device/list_button.dart';
import 'package:smart_home/views/details_device/num_up_down.dart';
import 'package:smart_home/views/logo/logo.dart';

class DetailDeviceScreen extends StatefulWidget {
  const DetailDeviceScreen({super.key, required this.device});
  final Device device;

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
                    widget.device.name,
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
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DeviceInfo(device: widget.device),
                NumUpDown(value: widget.device.value),
                ListButton(presenter: presenter!)
              ],
            ),
    );
  }
}
