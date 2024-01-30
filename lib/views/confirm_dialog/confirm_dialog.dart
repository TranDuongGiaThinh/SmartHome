import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smart_home/constants.dart';

class ConfirmationDialog {
  static Future<bool> show({
    required BuildContext context,
    required String title,
    required String content,
  }) async {
    Completer<bool> completer = Completer<bool>();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            style: const TextStyle(
              fontSize: MyConstants.fontHeader,
              fontWeight: FontWeight.bold,
              color: MyConstants.colorText,
            ),
          ),
          content: Text(
            content,
            style: const TextStyle(
              fontSize: MyConstants.fontText,
              color: MyConstants.colorText,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                completer.complete(false);
              },
              child: const Text(MyConstants.cancel),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                completer.complete(true);
              },
              child: const Text(MyConstants.confirm),
            ),
          ],
        );
      },
    );

    return completer.future;
  }
}
