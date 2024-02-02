import 'package:flutter/material.dart';
import 'package:smart_home/constants.dart';

class Status extends StatefulWidget {
  const Status({super.key, required this.isOn});
  final bool isOn;

  @override
  State<Status> createState() => _StatusState();
}

class _StatusState extends State<Status> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
            color: widget.isOn
                ? MyConstants.colorIconDeviceOn
                : MyConstants.colorIconDeviceOff,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          widget.isOn ? MyConstants.on : MyConstants.off,
          style: const TextStyle(
            fontSize: MyConstants.fontText,
            fontWeight: FontWeight.bold,
            color: MyConstants.colorText,
          ),
        ),
      ],
    );
  }
}
