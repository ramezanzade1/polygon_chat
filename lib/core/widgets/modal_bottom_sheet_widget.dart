import 'package:flutter/material.dart';

class ModalBottomSheetWidget {
  BuildContext context;
  double height;
  double width;
  EdgeInsets? margin;
  EdgeInsets? padding;
  Color? backgroundColor = Colors.white;
  Widget innerWidget;
  bool isBackButtonEnabled;
  Function(bool)? backButtonFunc;

  ModalBottomSheetWidget(
      {required this.context,
      required this.height,
      required this.width,
      this.margin,
      this.padding,
      this.backgroundColor,
      required this.innerWidget,
      this.isBackButtonEnabled = true,
      this.backButtonFunc});

  Future<dynamic> show() {
    return showModalBottomSheet(
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        context: context,
        builder: (builder) {
          return Container(
            height: height,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              resizeToAvoidBottomInset: true,
              body: SingleChildScrollView(
                child: Stack(
                  alignment: Alignment.center,
                  fit: StackFit.loose,
                  children: <Widget>[
                    innerWidget,
                    isBackButtonEnabled
                        ? Positioned(
                            top: height * 0.035,
                            left: width * 0.82,
                            child: Container(
                              alignment: Alignment.center,
                              child: InkWell(
                                onTap: () {
                                  if (backButtonFunc != null) {
                                    backButtonFunc!(true);
                                  }
                                  Navigator.pop(context);
                                },
                                child: Image.asset(
                                  "assets/images/close_black.png",
                                  height: 35,
                                  width: 35,
                                ),
                              ),
                            ),
                          )
                        : SizedBox()
                  ],
                ),
              ),
            ),
          );
        });
  }
}
