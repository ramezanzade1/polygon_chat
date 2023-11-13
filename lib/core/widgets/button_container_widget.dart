import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ButtonContainerWidget extends StatelessWidget {
  Color? backgroundColor;
  double height;
  double width;
  String? text;
  Decoration? decoration;
  Color? textColor;
  double fontSize;
  EdgeInsetsGeometry? margin;
  EdgeInsetsGeometry? padding;
  double letterSpacing;
  var event;

  ButtonContainerWidget(
      {this.backgroundColor,
      this.height = 56.0,
      this.width = 342.0,
      this.text,
      this.decoration,
      this.fontSize = 24,
      this.textColor,
      this.margin,
      this.padding,
      this.letterSpacing = 0.1,
      this.event});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: event != null ? event : null,
      child: Container(
        height: height,
        width: width,
        margin: margin,
        padding: padding,
        alignment: Alignment.center,
        color: decoration == null ? backgroundColor : null,
        decoration: decoration,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: AutoSizeText(
            text!,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: textColor,
                fontSize: fontSize,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
                letterSpacing: letterSpacing),
          ),
        ),
      ),
    );
  }
}
