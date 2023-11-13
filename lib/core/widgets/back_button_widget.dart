import 'package:flutter/material.dart';

import '../utill/base_navigator.dart';

class BackButtonContainerWidget extends StatelessWidget {
  final double height;
  final double? width;

  BackButtonContainerWidget({required this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.122,
      alignment: Alignment.bottomLeft,
      margin: EdgeInsets.only(bottom: height * 0.027, top: 1.0),
      child: InkWell(
        onTap: () => BaseNavigator.pop(context),
        child: const Icon(
          Icons.arrow_back,
          color: Colors.black,
          size: 35.0,
        ),
      ),
    );
  }
}
