import 'package:smart_home/models/noti.dart';

class NotiPresenter {
  NotiPresenter({required this.notifications, required this.reload});
  List<Noti> notifications = [];
  Function reload;

  static Future<List<Noti>> getAllNotifications() async {
    var results = [
      Noti(
          username: "tdgthinh",
          description: "đã tắt đèn",
          createAt: DateTime(2023)),
      Noti(
          username: "Gia Thịnh",
          description: "đã bật quạt",
          createAt: DateTime.now()),
    ];

    results.sort((a, b) => b.createAt.compareTo(a.createAt));

    return results;
  }

  String getNotiTime(DateTime dateTime) {
    DateTime now = DateTime.now();
    Duration difference = now.difference(dateTime);

    if (difference.inMinutes < 1) {
      return 'Bây giờ';
    } else if (difference.inHours < 1) {
      return '${difference.inMinutes} phút trước';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} giờ trước';
    } else if (difference.inHours < 48) {
      return 'Hôm qua';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} ngày trước';
    } else if (difference.inDays < 30) {
      return '${difference.inDays ~/ 7} tuần trước';
    } else if (difference.inDays < 365) {
      return '${difference.inDays ~/ 30} tháng trước';
    } else {
      return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
    }
  }
}
