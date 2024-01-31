import 'package:flutter/foundation.dart';
import '../data/repositories/data_local_repository.dart';

class GlobalData {
  static String username = "";
  static String boardname = "";

  load() async {
    try {
      Map<String, dynamic> map = await DataLocal().getMap();
      if (map.isNotEmpty) {
        GlobalData().fromJson(map);
      }
      if (kDebugMode) {
        print("Lấy dữ liệu local thành công");
      }
    } catch (e) {
      if (kDebugMode) {
        print("Lấy dự liệu local thất bại: $e");
      }
    }
  }

  save() async {
    await DataLocal().save(GlobalData().toJson());
  }

  clear() async {
    await DataLocal().clear();
    boardname = "";
  }

  fromJson(Map<String, dynamic> json) {
    username = json["username"];
    boardname = json["boardname"];
  }

  Map<String, dynamic> toJson() =>
      {"username": username, "boardname": boardname};
}
