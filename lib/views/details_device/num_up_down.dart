import 'package:flutter/material.dart';
import 'package:smart_home/constants.dart';
import 'package:smart_home/views/details_device/details_device_presenter.dart';

class NumUpDown extends StatefulWidget {
  const NumUpDown({super.key, required this.presenter});
  final DetailDevicePresenter presenter;

  @override
  State<NumUpDown> createState() => _NumUpDownState();
}

class _NumUpDownState extends State<NumUpDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width / 1.5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => widget.presenter.onClickChangeValueButton(false),
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: MyConstants.colorButtonUpDown,
              ),
              child: const Icon(
                MyConstants.iconDown,
                color: MyConstants.colorIcon,
              ),
            ),
          ),
          Text(
            widget.presenter.device.value.toString(),
            style: const TextStyle(
              fontSize: MyConstants.fontHeader,
              fontWeight: FontWeight.bold,
              color: MyConstants.colorText,
            ),
          ),
          GestureDetector(
            onTap: () => widget.presenter.onClickChangeValueButton(true),
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: MyConstants.colorButtonUpDown,
              ),
              child: const Icon(
                MyConstants.iconUp,
                color: MyConstants.colorIcon,
              ),
            ),
          )
        ],
      ),
    );
  }
}
