import 'package:flutter/material.dart';
import '../utill/app_color.dart';

EdgeInsetsGeometry modalBottomSheetPadding(final double width) {
  return screenContainerPadding(width);
}

Decoration modalBottomSheetDecoration() {
  return BoxDecoration(
      color: Colors.white,
      border: Border.all(width: 1.9, color: const Color(0x19000000)),
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(12.0),
        topRight: Radius.circular(12.0),
      ));
}

EdgeInsetsGeometry screenContainerPadding(final double width) =>
    EdgeInsets.only(left: width * 0.087, right: width * 0.087);

double dotIndicatorHeight(final double height) => height * 0.095;

double buttonContainerWidgetHeight(final double height) => 56;

double addedSocialAccountMobileScreenHeight({final double? height}) => height! * 0.6;

TextStyle appHintStyle(
    {final double fontSize = 17, final FontWeight fontWeight = FontWeight.w500, final Color? textColor}) {
  return TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: textColor != null ? textColor : AppColor.hintTextColor,
  );
}

Container itemDivider(
    {final double height = 0.5, required final EdgeInsetsGeometry margin, required final Color color}) {
  return Container(
    height: height,
    margin: margin,
    decoration: BoxDecoration(color: color != null ? color : AppColor.geryColor),
  );
}
