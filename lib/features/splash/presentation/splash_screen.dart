import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../core/constants/constants.dart';

class SplashScreen extends StatelessWidget {
  late double _height;
  late double _width;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        _height = sizingInformation.localWidgetSize.height;
        _width = sizingInformation.localWidgetSize.width;
        return Scaffold(
          body: Stack(
            fit: StackFit.loose,
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                color: Theme.of(context).primaryColor,
              ),
              Positioned(
                bottom: _height * 0.55,
                child: Container(
                  height: _height * 0.2,
                  width: _width * 0.4,
                  child: Image.asset(
                    "assets/images/kahpong_logo_splash.png",
                  ),
                ),
              ),
              Positioned(
                bottom: _height * 0.38,
                child: Container(
                  height: _height * 0.06,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      Constants.appName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
