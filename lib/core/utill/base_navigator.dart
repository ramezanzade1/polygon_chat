import 'package:flutter/material.dart';

class BaseNavigator extends Navigator {
  static pushTo(final BuildContext context, var targetPage) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => targetPage));
  }

  static pop(final BuildContext context) {
    try {
      Navigator.pop(context);
    } catch (error) {
      throw new Exception(error.toString());
    }
  }

  static popUntil(final BuildContext context, final String routeName) {
    Navigator.popUntil(context, ModalRoute.withName(routeName));
  }

  static pushNamedAndRemoveUntil({
    required final BuildContext context,
    required final String routeName,
  }) {
    Navigator.pushNamedAndRemoveUntil(context, routeName, (route) => false);
  }
}
