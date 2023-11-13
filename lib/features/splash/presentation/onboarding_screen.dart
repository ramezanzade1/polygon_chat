import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../core/constants/constants.dart';
import '../../../core/widgets/button_container_widget.dart';
import '../../../core/widgets/modal_bottom_sheet_widget.dart';
import '../../../core/widgets/welcome_widget.dart';

class OnboardingScreen extends StatelessWidget {
  late double _height;
  late double _width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ResponsiveBuilder(
        builder: (BuildContext context, sizingInformation) {
          _height = sizingInformation.localWidgetSize.height;
          _width = sizingInformation.localWidgetSize.width;
          return Container(
            margin: const EdgeInsets.only(top: 0.5),
            child: Flex(
              direction: Axis.vertical,
              children: <Widget>[
                Container(
                  height: _height * 0.061,
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: _height * 0.1, bottom: _height * 0.027, left: _width * 0.087),
                  child: FittedBox(
                    child: Text(
                      Constants.appName,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 48.0,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.5),
                    ),
                  ),
                ),
                Expanded(
                    child: Stack(
                  fit: StackFit.expand,
                  alignment: Alignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: _height * 0.02),
                      child: Image.asset("assets/images/onboarding.png", fit: BoxFit.fill),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: _width * 0.087),
                      child:const FittedBox(
                        child: Text(
                          Constants.onboardingMessage,
                          textAlign: TextAlign.start,
                          style:  TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: _height * 0.083,
                      right: _width * 0.093,
                      left: _width * 0.093,
                      child: ButtonContainerWidget(
                        text: Constants.onboardingStartedButton,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(4.0),
                          boxShadow: const [
                            BoxShadow(
                                color: Color(0x33ea0000),
                                offset: Offset(0, 25),
                                blurRadius: 30,
                                spreadRadius: 0.5)
                          ],
                        ),
                        textColor: Colors.white,
                        event: () {
                          ModalBottomSheetWidget(
                              context: context,
                              height: _height * 0.4,
                              width: _width,
                              innerWidget: WelcomeWidget(
                                height: _height * 0.4,
                                width: _width,
                                // userService: UserServiceImpl(),
                              )).show();
                        },
                      ),
                    ),
                  ],
                )),
              ],
            ),
          );
        },
      ),
    );
  }
}
