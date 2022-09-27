import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myapp/presentation/resources/assets_manager.dart';
import 'package:myapp/presentation/resources/color_manager.dart';
import 'package:myapp/presentation/resources/strings_manager.dart';
import 'package:myapp/presentation/resources/value_manager.dart';

import '../resources/routes_manager.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    // TODO: viewmodel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        elevation: AppSize.zero,
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
          return OnboardingPage(_sliderList[index]);
        },
      ),
      bottomSheet: Container(
          color: ColorManager.white,
          height: AppSize.extraLarge,
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Routes.loginRoute);
                  },
                  child: Text(
                    AppStrings.skip,
                    style: Theme.of(context).textTheme.subtitle2,
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              // Add layout for page indicator and arrows
              _getBottomSheetWidget(),
            ],
          )),
    );
  }

  Widget _getBottomSheetWidget() {
    return Container(
      color: ColorManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // left arrow
          Padding(
            padding: const EdgeInsets.all(AppPadding.medium),
            child: GestureDetector(
              child: SizedBox(
                height: AppSize.medium,
                width: AppSize.medium,
                child: SvgPicture.asset(ImageAssets.leftArrow),
              ),
              onTap: () {
                // go to previous slide
                _pageController.animateToPage(
                  _getPreviousIndex(),
                  duration: const Duration(milliseconds: DurationConstant.fast),
                  curve: Curves.bounceInOut,
                );
              },
            ),
          ),

          // circle indicator
          Row(
            children: [
              for (int index = 0; index < _sliderList.length; index++)
                Padding(
                  padding: const EdgeInsets.all(
                    AppPadding.small,
                  ),
                  child: _getProperCircle(index),
                ),
            ],
          ),

          // right arrow
          Padding(
            padding: const EdgeInsets.all(AppPadding.medium),
            child: GestureDetector(
              child: SizedBox(
                height: AppSize.medium,
                width: AppSize.medium,
                child: SvgPicture.asset(ImageAssets.rightArrow),
              ),
              onTap: () {
                // go to next slide
                _pageController.animateToPage(
                  _getNextIndex(),
                  duration: const Duration(milliseconds: DurationConstant.fast),
                  curve: Curves.bounceInOut,
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _getProperCircle(int index) {
    if (index == _currentIndex) {
      return SvgPicture.asset(ImageAssets.hollowCircle);
    } else {
      return SvgPicture.asset(ImageAssets.solidCircle);
    }
  }

  int _getPreviousIndex() {
    int previousIndex = _currentIndex - 1;
    if (previousIndex == -1) {
      previousIndex = _sliderList.length - 1; // infinite loop. Loop to the end of the list when at index 0.
    }

    return previousIndex;
  }

  int _getNextIndex() {
    int nextIndex = _currentIndex++;
    if (nextIndex >= _sliderList.length) {
      nextIndex = 0;
    }

    return nextIndex;
  }
}

class OnboardingPage extends StatelessWidget {
  final SliderObject _sliderObject;

  const OnboardingPage(this._sliderObject, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: AppSize.small),
        Padding(
          padding: const EdgeInsets.all(AppPadding.small),
          child: Text(
            _sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.thin),
          child: Text(
            _sliderObject.subtitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        const SizedBox(
          height: AppSize.medium,
        ),
        SvgPicture.asset(_sliderObject.image),
      ],
    );
  }
}
