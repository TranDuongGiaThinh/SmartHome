import 'package:flutter/material.dart';
import 'package:smart_home/data/models/device.dart';

class DeviceInfo extends StatefulWidget {
  const DeviceInfo({super.key, required this.device});
  final Device device;

  @override
  State<DeviceInfo> createState() => _DeviceInfoState();
}

class _DeviceInfoState extends State<DeviceInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("info"),
    );
  }
}
