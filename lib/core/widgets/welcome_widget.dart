import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:polygon_chat/core/widgets/widget_properties.dart';

import '../../features/registration/presentation/registration_screen.dart';
import '../constants/constants.dart';
import '../utill/base_navigator.dart';
import 'button_container_widget.dart';

class WelcomeWidget extends StatelessWidget {
  final double height;
  final double width;

  // final UserServiceImpl userService;

  WelcomeWidget({
    required this.height,
    required this.width,
    // required this.userService,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: modalBottomSheetPadding(width),
      decoration: modalBottomSheetDecoration(),
      child: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: height * 0.15,
              margin: EdgeInsets.only(top: height * 0.06, bottom: height * 0.07),
              alignment: Alignment.centerLeft,
              child:const AutoSizeText(Constants.welcome,
                  textAlign: TextAlign.left,
                  style:  TextStyle(
                    color: Colors.black,
                    fontSize: 45,
                    fontWeight: FontWeight.w700,
                  )),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ButtonContainerWidget(
                    height: buttonContainerWidgetHeight(height),
                    text: Constants.createAccount,
                    textColor: Colors.white,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    event: () => BaseNavigator.pushTo(context, RegistrationScreen()),
                  ),
                  ButtonContainerWidget(
                    height: buttonContainerWidgetHeight(height),
                    margin: EdgeInsets.only(top: height * 0.05),
                    text: Constants.signin,
                    textColor: Colors.black,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 1.5, color: Colors.grey),
                        borderRadius: BorderRadius.circular(4)),
                    // event: () => BaseNavigator.pushTo(context, LoginScreen()),
                  )
                ],
              ),
            ),
            const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
