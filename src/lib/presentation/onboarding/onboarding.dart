import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/presentation/resources/assets_manager.dart';
import 'package:myapp/presentation/resources/color_manager.dart';
import 'package:myapp/presentation/resources/strings_manager.dart';
import 'package:myapp/presentation/resources/value_manager.dart';

class OnboardingView extends StatefulWidget {
  OnboardingView({Key? key}) : super(key: key);

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late final List<SliderObject> _sliderList = _getSliderData();
  int _currentIndex = 0;
  PageController _pageController = PageController(initialPage: 0);

  List<SliderObject> _getSliderData() => [
        SliderObject(
            AppStrings.onboardingTitle1, AppStrings.onboardingSubtitle1, ImageAssets.onboardingLogo1),
        SliderObject(
            AppStrings.onboardingTitle2, AppStrings.onboardingSubtitle2, ImageAssets.onboardingLogo2),
        SliderObject(
            AppStrings.onboardingTitle3, AppStrings.onboardingSubtitle3, ImageAssets.onboardingLogo3),
        SliderObject(
            AppStrings.onboardingTitle4, AppStrings.onboardingSubtitle4, ImageAssets.onboardingLogo4),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(
          elevation: AppSize.small,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.white,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
        body: PageView.builder(
          controller: _pageController,
          itemCount: _sliderList.length,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          itemBuilder: (context, index) {
            // return OnBoardingPage
            return const Text('test');
          },
        ));
  }
}

class SliderObject {
  String title;
  String subtitle;
  String image;

  SliderObject(this.title, this.subtitle, this.image);
}
