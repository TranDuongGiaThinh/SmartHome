import 'package:flutter/material.dart';
import 'package:smart_home/views/details_device/details_device_presenter.dart';

class ListButton extends StatelessWidget {
  const ListButton({super.key, required this.presenter});
  final DetailDevicePresenter presenter;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("listButton"),
    );
  }
}
