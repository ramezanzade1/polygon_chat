import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../widgets/widget_properties.dart';
import 'app_color.dart';

class AppTheme {
  static ThemeData mainTheme() {
    return ThemeData(
      fontFamily: Constants.fontFamilyName,
      brightness: Brightness.light,
      primaryColor: AppColor.primaryColor,
      primaryColorDark: AppColor.primaryColorDark,
      primaryColorLight: AppColor.primaryColorLight,
      unselectedWidgetColor: Colors.black,
      hintColor: AppColor.hintTextColor,
      inputDecorationTheme: InputDecorationTheme(
          hintStyle: appHintStyle(),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColor.primaryColor),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black45),
          ),
          labelStyle: appHintStyle()),
    );
  }
}
