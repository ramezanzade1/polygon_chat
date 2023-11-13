import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polygon_chat/features/splash/presentation/onboarding_screen.dart';
import 'package:polygon_chat/features/splash/presentation/splash_screen.dart';

import 'core/utill/app_theme.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App() : super();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.mainTheme(),
      home: OnboardingScreen(),
    );
  }
}
