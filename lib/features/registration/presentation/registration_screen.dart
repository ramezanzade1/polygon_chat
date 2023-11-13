import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:responsive_builder/responsive_builder.dart';

import '../../../core/constants/constants.dart';
import '../../../core/widgets/back_button_widget.dart';
import '../../../core/widgets/button_container_widget.dart';
import '../../../core/widgets/snakbar_widget.dart';
import '../../../core/widgets/widget_properties.dart';

class RegistrationScreen extends StatefulWidget {
  // final UserServiceImpl userService;

  RegistrationScreen();

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late double _height;
  late double _width;
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  // final UserServiceImpl userService;
  // RegistrationBloc _registrationBloc;

  @override
  void initState() {
    super.initState();
    // _registrationBloc = RegistrationBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ScreenTypeLayout.builder(
        mobile: (BuildContext context) {
          return ResponsiveBuilder(
            builder: (context, sizingInformation) {
              _height = sizingInformation.localWidgetSize.height;
              _width = sizingInformation.localWidgetSize.width;

              return Scaffold(
                resizeToAvoidBottomInset: true,
                body: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    height: _height,
                    margin: EdgeInsets.only(left: _width * 0.086, right: _width * 0.086),
                    child: Flex(
                      direction: Axis.vertical,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        BackButtonContainerWidget(height: _height),
                        Container(
                          height: _height * 0.09,
                          alignment: Alignment.centerLeft,
                          child: const FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.center,
                            child: AutoSizeText(Constants.createKahpongAccount,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 36,
                                  fontWeight: FontWeight.w700,
                                )),
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Container(
                              child: _registrationForm(),
                            ),
                          ),
                        ),
                        ButtonContainerWidget(
                          height: buttonContainerWidgetHeight(_height),
                          margin: EdgeInsets.only(top: _height * 0.022, bottom: _height * 0.02),
                          text: Constants.createAccount,
                          textColor: Colors.white,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          event: () => registrationEvent(
                            firstName: _firstNameController.text,
                            lastName: _lastNameController.text,
                          ),
                        ),
                        Container(
                          height: _height * 0.122,
                          alignment: Alignment.center,
                          child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(children: [
                                const TextSpan(
                                    text: Constants.alreadyHaveAccount,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    )),
                                TextSpan(
                                  text: Constants.signin,
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  // recognizer: TapGestureRecognizer()
                                  //   ..onTap = () => BaseNavigator.pushTo(context, LoginScreen()),
                                ),
                              ])),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Column _registrationForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _registrationTextField(
          controller: _firstNameController,
          hintText: Constants.firstName,
          inputType: TextInputType.text,
        ),
        _registrationTextField(
          controller: _lastNameController,
          hintText: Constants.lastName,
          inputType: TextInputType.text,
        ),
        Container(
          height: _height * 0.026,
          margin: EdgeInsets.only(top: _height * 0.017, bottom: 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 5,
                color: Colors.amber,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: _width * 0.027),
                  alignment: Alignment.centerLeft,
                  child: const AutoSizeText(Constants.registrationPasswordDescription,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                      softWrap: true),
                ),
              )
            ],
          ),
        ),

      ],
    );
  }

  bool _checkRegistrationFields({
    required final String firstName,
    required final String lastName,
  }) {
    if (firstName.isEmpty) {
      SnackBarWidget(context: context, text: Constants.firstNameNotEmpty).showErrorSnackBar();
      return false;
    }
    if (lastName.isEmpty) {
      SnackBarWidget(context: context, text: Constants.lastNameNotEmpty).showErrorSnackBar();
      return false;
    }

    return true;
  }

  Container _registrationTextField({
    required final TextEditingController controller,
    required final String hintText,
    final TextInputType inputType = TextInputType.text,
  }) {
    const textFieldStyle = TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.w800,
    );

    return Container(
      height: _height * 0.066,
      alignment: Alignment.center,
      child: TextField(
        controller: controller,
        style: textFieldStyle,
        decoration: InputDecoration(
          hintText: hintText,
        ),
        keyboardType: inputType,

      ),
    );
  }

  void registrationEvent({
    required final String firstName,
    required final String lastName,
  }) {
    if (_checkRegistrationFields(
      firstName: firstName,
      lastName: lastName,
    )) {
      // _registrationBloc.add(RegistrationButtonPressedEvent(
      //     userDTO: UserDTO(
      //   firstName: firstName,
      //   lastName: lastName,
      //   email: email,
      //   mobileNumber: _countryDialCode + phoneNumber,
      //   countryDialCode: _countryDialCode,
      //   countryIsoCode: _countryIsoCode,
      //   password: password,
      // )));
    }
  }

  @override
  void dispose() {
    super.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();

    // _registrationBloc.close();
  }
}
