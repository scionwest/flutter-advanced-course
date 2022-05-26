import 'package:flutter/material.dart';
import 'package:myapp/presentation/font_manager.dart';

TextStyle _getTextStyle(double fontSize, String fontFamily, FontWeight fontWeight, Color color) =>
    TextStyle(fontSize: fontSize, fontFamily: fontFamily, color: color, fontWeight: fontWeight);

TextStyle getRegularStyle({double fontSize = FontSize.normal, required Color color}) =>
    _getTextStyle(fontSize, FontConstants.fontFamily, FontWeightManager.regular, color);

TextStyle getLightStyle({double fontSize = FontSize.normal, required Color color}) =>
    _getTextStyle(fontSize, FontConstants.fontFamily, FontWeightManager.light, color);

TextStyle getMediumStyle({double fontSize = FontSize.normal, required Color color}) =>
    _getTextStyle(fontSize, FontConstants.fontFamily, FontWeightManager.medium, color);

TextStyle getBoldStyle({double fontSize = FontSize.normal, required Color color}) =>
    _getTextStyle(fontSize, FontConstants.fontFamily, FontWeightManager.bold, color);

TextStyle getSemiBoldStyle({double fontSize = FontSize.normal, required Color color}) =>
    _getTextStyle(fontSize, FontConstants.fontFamily, FontWeightManager.semiBold, color);
