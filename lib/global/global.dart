import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

class GlobalData {
  static String username = "";
  static String boardname = "";

  load() async {
    try {
      GlobalData().fromJson(await DataLocal().getMap());
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

  fromJson(Map<String, dynamic> json) {
    username = json["username"];
    boardname = json["boardname"];
  }

  Map<String, dynamic> toJson() =>
      {"username": username, "boardname": boardname};
}

class DataLocal {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;

    File file = File('$path/data.json');
    if (!(await file.exists())) {
      await file.create(recursive: true);
    }
    return file;
  }

  Future<String> getStringJson() async {
    String s = "";
    try {
      final localFile = await _localFile;
      s = await localFile.readAsString();
      if (kDebugMode) {
        print("getStringJson() thành công");
      }
    } catch (e) {
      if (kDebugMode) {
        print("getStringJson() thất bại: $e");
      }
    }
    return s;
  }

  Future<Map<String, dynamic>> getMap() async {
    try {
      Map<String, dynamic> map = jsonDecode(await getStringJson());
      if (kDebugMode) {
        print("getMap() từ local thành công");
      }
      return map;
    } catch (e) {
      if (kDebugMode) {
        print("getMap() từ local thất bại: $e");
      }
      return {};
    }
  }

  Future<void> save(Map<String, dynamic> map) async {
    try {
      final file = await _localFile;

      final jsonString = json.encode(map);

      await file.writeAsString(jsonString);
      if (kDebugMode) {
        print("Lưu dữ liệu ở local thành công");
      }
    } catch (e) {
      if (kDebugMode) {
        print("Lưu dữ liệu ở local thất bại: $e");
      }
    }
  }

  Future<void> clear() async {
    try {
      final file = await _localFile;

      await file.writeAsString('');

      if (kDebugMode) {
        print("Xóa dữ liệu ở local thành công");
      }
    } catch (e) {
      if (kDebugMode) {
        print("Xóa dữ liệu ở local thất bại: $e");
      }
    }
  }
}
