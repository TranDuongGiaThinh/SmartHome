import 'package:flutter/material.dart';

class SignUpPresenter{
  static String username = "";
  TextEditingController txt = TextEditingController();

  onClickButton(Function callBack){
    username = txt.text;
    callBack();
  }
}