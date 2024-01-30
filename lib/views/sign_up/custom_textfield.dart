import 'package:flutter/material.dart';
import 'package:smart_home/views/sign_up/sign_up_presenter.dart';
import '../../constants.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.txt,
    required this.label,
    required this.tooltip,
    required this.presenter,
    required this.callBack,
  });
  final TextEditingController txt;
  final String label;
  final String tooltip;
  final SignUpPresenter presenter;
  final Function callBack;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late FocusNode _focusNode;
  bool isTextFieldFocus = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        isTextFieldFocus = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextField(
        controller: widget.txt,
        focusNode: _focusNode,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          hintText: widget.label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide:
                const BorderSide(color: MyConstants.colorTextFieldUnselected),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide:
                const BorderSide(color: MyConstants.colorTextFieldSelected),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              Icons.info_outlined,
              color: isTextFieldFocus
                  ? MyConstants.colorTextFieldSelected
                  : MyConstants.colorTextFieldUnselected,
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(widget.tooltip),
                ),
              );
            },
            tooltip: widget.tooltip,
          ),
        ),
        onTap: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(widget.tooltip),
            ),
          );
          _focusNode.requestFocus();
          widget.presenter.onTapTextField(widget.callBack);
        },
      ),
    );
  }
}
