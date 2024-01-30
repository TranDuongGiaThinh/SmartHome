import 'package:flutter/material.dart';
import 'package:smart_home/constants.dart';
import 'package:smart_home/views/sign_up/custom_textfield.dart';
import 'package:smart_home/views/sign_up/sign_up_presenter.dart';

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
        padding:
            const EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 10),
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(MyConstants.logo), fit: BoxFit.fill)),
          child: Column(
            mainAxisAlignment: presenter.isTextFieldFocus
                ? MainAxisAlignment.start
                : MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    MyConstants.hello,
                    style: TextStyle(
                        fontSize: MyConstants.fontHeader,
                        fontWeight: FontWeight.bold,
                        color: MyConstants.colorTextInSignUp),
                  ),
                  Text(
                    MyConstants.wellcome,
                    style: TextStyle(
                        fontSize: MyConstants.fontText,
                        fontWeight: FontWeight.bold,
                        color: MyConstants.colorTextInSignUp),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              presenter.message,
                              style: const TextStyle(
                                  fontSize: MyConstants.fontText,
                                  color: MyConstants.colorMessage),
                            ),
                          ],
                        ),
                  CustomTextField(
                    txt: presenter.txtUsername,
                    label: MyConstants.enterName,
                    tooltip: MyConstants.tooltipUsername,
                    presenter: presenter,
                    callBack: () => setState(() {}),
                  ),
                  CustomTextField(
                    txt: presenter.txtCode,
                    label: MyConstants.enterCode,
                    tooltip: MyConstants.tooltipCode,
                    presenter: presenter,
                    callBack: () => setState(() {}),
                  ),
                  ElevatedButton(
                    onPressed: () => presenter.onClickButton(
                        widget.callBack, () => setState(() {})),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      fixedSize: const Size(150, 50),
                    ),
                    child: const Text(MyConstants.ok),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
