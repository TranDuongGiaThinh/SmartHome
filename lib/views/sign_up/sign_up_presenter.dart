import 'package:flutter/material.dart';
import 'package:smart_home/constants.dart';
import 'package:smart_home/global/global.dart';

class SignUpPresenter {
  String message = "";
  TextEditingController txtCode = TextEditingController();
  TextEditingController txtUsername = TextEditingController();
  bool isTextFieldFocus = false;

  Future<bool> checkCode(String code) async {
    return true;
  }

  onClickButton(Function callBack, Function reload) {
    if (txtUsername.text.isEmpty) {
      message = MyConstants.messageUsernameEmpty;
      reload();
      return;
    } else if (txtUsername.text.length > 50) {
      message = MyConstants.messageUserNameOverLength;
      reload();
      return;
    } else if (txtCode.text.isEmpty) {
      message = MyConstants.messageCodeEmpty;
      reload();
      return;
    } else {
      checkCode(txtCode.text).then((value) {
        if (value) {
          GlobalData.code = txtCode.text;
          GlobalData.username = txtUsername.text;
          callBack();
        }else{
          message = MyConstants.messageCodeInvalid;
          reload();
        }
      });
    }
  }

  onTapTextField(Function reload) {
    message = "";
    isTextFieldFocus = true;
    reload();
  }
}
