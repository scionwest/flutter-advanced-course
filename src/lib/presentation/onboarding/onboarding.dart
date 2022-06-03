import 'package:flutter/material.dart';
import 'package:myapp/presentation/resources/color_manager.dart';

class OnboardingView extends StatefulWidget {
  OnboardingView({Key? key}) : super(key: key);

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: const Text('Welcome to onboarding.'),
    );
  }
}
