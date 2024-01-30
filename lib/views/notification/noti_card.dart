import 'package:flutter/material.dart';
import 'package:smart_home/constants.dart';
import 'package:smart_home/data/models/noti.dart';
import 'package:smart_home/views/notification/noti_presenter.dart';

class NotiCard extends StatelessWidget {
  const NotiCard({super.key, required this.noti, required this.presenter});
  final Noti noti;
  final NotiPresenter presenter;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 1),
        padding: const EdgeInsets.only(right: 10),
        width: MediaQuery.of(context).size.width - 20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: MyConstants.colorCard,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              presenter.getNotiTime(noti.createAt),
              style: const TextStyle(
                  fontSize: MyConstants.fontNotiTime,
                  color: MyConstants.colorCard),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  noti.username.toUpperCase(),
                  style: const TextStyle(
                      fontSize: MyConstants.fontText,
                      fontWeight: FontWeight.bold,
                      color: MyConstants.colorText),
                ),
                Text(
                  " ${noti.description}",
                  style: const TextStyle(
                      fontSize: MyConstants.fontText,
                      color: MyConstants.colorText),
                ),
              ],
            ),
            Text(
              presenter.getNotiTime(noti.createAt),
              style: const TextStyle(
                  fontSize: MyConstants.fontNotiTime,
                  color: MyConstants.colorText),
            ),
          ],
        ));
  }
}
