import 'dart:async';

import 'package:myapp/domain/model.dart';
import 'package:myapp/presentation/base/baseviewmodel.dart';
import 'package:myapp/presentation/resources/assets_manager.dart';

import '../resources/strings_manager.dart';

class OnboardingViewModel extends BaseViewModel with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  // stream controllers
  final StreamController _streamController = StreamController<SliderViewObject>();
  int _currentIndex = 0;

  late final List<SliderObject> _sliderList;

  // inputs
  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _sliderList = _getSliderData();
  }

  @override
  void goNext() {
    // TODO: implement goNext
  }

  @override
  void goPrevious() {
    // TODO: implement goPrevious
  }

  @override
  void onPageChanged(int newIndex) {
    // TODO: implement onPageChanged
  }

  @override
  // TODO: implement inputSliderViewObject
  Sink get inputSliderViewObject => throw UnimplementedError();

  // outputs
  @override
  // TODO: implement outputSliderViewObject
  Stream<SliderViewObject> get outputSliderViewObject =>
      _streamController.stream.map((sliderViewObject) => sliderViewObject);

  // private functions

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
}

// inputs mean the order that our view model will receive from our view
abstract class OnBoardingViewModelInputs {
  void goNext(); // when user clicks on right arrow or swipe
  void goPrevious(); // when user clicks on left arrow or swipe
  void onPageChanged(int newIndex);

  Sink get inputSliderViewObject; // this is the way to add data to the stream .. stream input
}

// outputs mean data or results that will be sent from our view modfel
abstract class OnBoardingViewModelOutputs {
  Stream<SliderViewObject>
      get outputSliderViewObject; // This is the way to get data out to the view .. Stream output
}

class SliderViewObject {
  SliderObject sliderObject;
  int numberOfSlides;
  int currentIndex;

  SliderViewObject(this.sliderObject, this.numberOfSlides, this.currentIndex);
}
