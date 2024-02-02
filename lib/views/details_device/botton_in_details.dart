import 'package:flutter/material.dart';

import '../../constants.dart';

class BottonInDetails extends StatefulWidget {
  const BottonInDetails({
    super.key,
    required this.onClick,
    required this.icon,
    required this.colorIcon,
  });
  final Function onClick;
  final IconData icon;
  final Color colorIcon;

  @override
  State<BottonInDetails> createState() => _BottonInDetailsState();
}

class _BottonInDetailsState extends State<BottonInDetails> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onClick(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: MyConstants.colorButton,
        ),
        child: Icon(
          widget.icon,
          color: widget.colorIcon,
          size: 60,
        ),
      ),
    );
  }
}
