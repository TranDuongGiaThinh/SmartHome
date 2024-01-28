import 'package:flutter/material.dart';
import 'package:smart_home/constants.dart';

class SignUpPresenter {
  static String username = "";
  String message = "";
  TextEditingController txt = TextEditingController();
  bool isTextFieldFocus = false;

  onClickButton(Function callBack, Function reload) {
    if (txt.text.isEmpty) {
      message = MyConstants.messageUsernameEmpty;
      reload();
      return;
    } else if (txt.text.length > 50) {
      message = MyConstants.messageUserNameOverLength;
      reload();
      return;
    } else {
      username = txt.text;
      callBack();
    }
  }

  onTapTextField(Function reload) {
    message = "";
    isTextFieldFocus = true;
    reload();
  }
}
