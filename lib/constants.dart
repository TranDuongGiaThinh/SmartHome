import 'package:flutter/material.dart';

class MyConstants {
  static const double fontNotiTime = 10.0;
  static const double fontText = 13.0;
  static const double fontHeader = 16.0;
  

  static const Color colorText = Colors.black54;
  static const Color colorMessage = Colors.redAccent;
  static const Color colorTextWithBackground = Colors.white;
  static const Color colorTextInSignUp = Colors.green;

  static const Color colorContentSelected = Colors.yellowAccent;
  static const Color colorContentUnselected = Colors.white;

  static const Color colorIcon = Colors.black54;
  static const Color colorIconDeviceOn = Colors.yellowAccent;
  static const Color colorIconDevicetOff = Colors.black54;
  static const Color colorIconPowerOn = Colors.redAccent;
  static const Color colorIconPowerOff = Colors.black54;

  static const Color colorBackgroundApp = Colors.white;
  static const Color colorBackgroundContainer = Colors.greenAccent;
  static const Color colorAppbar = Colors.green;
  static const Color colorNavbar = Colors.green;
  static const Color colorGuage = Colors.green;
  static const Color colorGuage20Percent = Colors.green;
  static const Color colorGuage35Percent = Colors.lightGreen;
  static const Color colorGuage50Percent = Colors.yellow;
  static const Color colorGuage65Percent = Colors.orange;
  static const Color colorGuage80Percent = Colors.orange;
  static const Color colorGuage100Percent = Colors.red;
  static const Color colorButton = Colors.greenAccent;
  static const Color colorCard = Colors.greenAccent;

  static const int homeIndex = 0;
  static const int notiIndex = 1;

  static const int lightIndex = 0;
  static const int fanIndex = 1;
  static const int tiviIndex = 2;

  static const String appName = "SmartHome";
  static const String hello = "Xin Chào!";
  static const String wellcome = "Chào mừng bạn đến với $appName";
  static const String logo = "data/logo.png";

  static const String home = "Trang chủ";
  static const String noti = "Thông báo";

  static const String light = "Đèn";
  static const String fan = "Quạt";
  static const String tivi = "Tivi";

  static const String on = "Đang bật";

  static const String enterName = "Nhập tên của bạn";
  static const String ok = "OK";
  
  static const String messageUsernameEmpty = "Tên không được bỏ trống!";
  static const String messageUserNameOverLength = "Tên phải có độ dài dưới 50 ký tự!";

  static const String unitCelsius = "°C";
  static const String unitPercent = "%";
  
  static const String guageCelsius = "Nhiệt độ";
  static const String guageHumidity = "Độ ẩm";
  static const String guageUsage = "Thiết bị đang bật";
  
  static const String cancel = "Hủy bỏ";
  static const String confirm = "Xác nhận";
  static const String contentConfirmTurnOffAll = "Bạn muốn tắt tất cả thiết bị?";
}
