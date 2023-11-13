import 'package:flutter/material.dart';

class SnackBarWidget {
  final BuildContext context;
  final String text;
  final VoidCallback? whenComplete;

  SnackBarWidget({required this.context, this.text = "", this.whenComplete});

  void showCircularProgressSnackBar() {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        duration: const Duration(minutes: 5),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text, textDirection: TextDirection.rtl),
            const CircularProgressIndicator(),
          ],
        ),
      ));
  }

  void showErrorSnackBar() {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(

        content: Text(text,textDirection: TextDirection.rtl,),
        backgroundColor: Colors.red,
      ));
  }

  void showSucceedSnackBar() {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        content: Text(text),
        backgroundColor: Colors.green,
      ));
  }

  void hideSnackBar() {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }
}
