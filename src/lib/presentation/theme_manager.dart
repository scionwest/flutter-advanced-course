import 'package:flutter/material.dart';
import 'package:myapp/presentation/color_manager.dart';
import 'package:myapp/presentation/font_manager.dart';
import 'package:myapp/presentation/styles_manager.dart';
import 'package:myapp/presentation/value_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // main colors of the app
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.primaryOpacity70,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,

    // ripple color
    splashColor: ColorManager.primaryOpacity70,
    accentColor: ColorManager.grey,

    // card view theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.small,
    ),

    // app bar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.primary,
      elevation: AppSize.small,
      shadowColor: ColorManager.primaryOpacity70,
      titleTextStyle: getRegularStyle(color: ColorManager.white, fontSize: FontSize.heading1),
    ),

    // button theme
    buttonTheme: const ButtonThemeData(
      shape: StadiumBorder(),
      // disabledColor: ColorManager.grey1,
      // buttonColor: ColorManager.primary,
      // splashColor: ColorManager.primaryOpacity70,
    ),

    // elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(color: ColorManager.white),
        primary: ColorManager.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.medium)),
      ),
    ),

    // text theme
    textTheme: TextTheme(
      headline1: getSemiBoldStyle(fontSize: FontSize.heading1, color: ColorManager.darkGrey),
      subtitle1: getMediumStyle(color: ColorManager.lightGrey, fontSize: FontSize.small),
      caption: getRegularStyle(color: ColorManager.grey1),
      bodyText1: getRegularStyle(color: ColorManager.grey),
    ),

    // input theme
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.small),
      hintStyle: getRegularStyle(color: ColorManager.grey1),
      labelStyle: getMediumStyle(color: ColorManager.darkGrey),
      errorStyle: getRegularStyle(color: ColorManager.error),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.grey,
          width: AppSize.thin,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.small)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.primary,
          width: AppSize.thin,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.small)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.error,
          width: AppSize.thin,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.small)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.primary,
          width: AppSize.thin,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.small)),
      ),
    ),
  );
}
