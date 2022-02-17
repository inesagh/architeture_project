import 'package:architeture_project/presentation/color_manager.dart';
import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    //  main colors of the app
    primaryColor: ColorManager.primary,
    primaryColorDark: ColorManager.darkPrimary,
    primaryColorLight: ColorManager.primaryOpacity70,
    disabledColor: ColorManager.grey1, //button
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: ColorManager.grey,
    ),
    //  card view theme
    //  app bar   theme
    //  button    theme
    //  text      theme
    //  input decoration theme(text from field)
  );
}
