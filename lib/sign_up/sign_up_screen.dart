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
        padding: const EdgeInsets.all(10),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: TextField(
                    controller: presenter.txt,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
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
                const SizedBox(width: 5),
                ElevatedButton(
                  onPressed: () => presenter.onClickButton(widget.callBack),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    fixedSize: const Size(50, 50),
                  ),
                  child: const Text(MyConstants.ok),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
