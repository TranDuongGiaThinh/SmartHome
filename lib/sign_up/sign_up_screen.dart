import 'package:flutter/material.dart';
import 'package:smart_home/constants.dart';
import 'package:smart_home/logo/logo.dart';
import 'package:smart_home/sign_up/sign_up_presenter.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key, required this.callBack});
  final Function callBack;

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  SignUpPresenter presenter = SignUpPresenter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              MyConstants.hello,
              style: TextStyle(
                  fontSize: MyConstants.fontHeader,
                  fontWeight: FontWeight.bold,
                  color: MyConstants.colorTextInSignUp),
            ),
            const Text(
              MyConstants.wellcome,
              style: TextStyle(
                  fontSize: MyConstants.fontText,
                  fontWeight: FontWeight.bold,
                  color: MyConstants.colorTextInSignUp),
            ),
            const Logo(),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
              child: TextField(
                controller: presenter.txt,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  hintText: MyConstants.enterName,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                        color: MyConstants.colorContentUnselected),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                        color: MyConstants.colorContentSelected),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => presenter.onClickButton(widget.callBack),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  fixedSize:const Size(150, 40),
                  ),
                  child: const Text(MyConstants.ok),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
