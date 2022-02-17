import 'package:architeture_project/presentation/color_manager.dart';
import 'package:architeture_project/presentation/font_manager.dart';
import 'package:architeture_project/presentation/styles_manager.dart';
import 'package:architeture_project/presentation/values_manager.dart';
import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    //  main colors of the app
    primaryColor: ColorManager.primary,
    primaryColorDark: ColorManager.darkPrimary,
    primaryColorLight: ColorManager.primaryOpacity70,
    disabledColor: ColorManager.grey1, //ex. button
    splashColor: ColorManager.primaryOpacity70, //ripple color
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: ColorManager.grey,
    ),

    //  card view theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    ),

    //  app bar   theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.primary,
      shadowColor: ColorManager.primaryOpacity70,
      titleTextStyle: getRegularTextStyle(
          color: ColorManager.white, fontSize: FontSize.s16),
      elevation: AppSize.s4,
    ),

    //  button    theme
    buttonTheme: ButtonThemeData(
      buttonColor: ColorManager.primary,
      splashColor: ColorManager.primaryOpacity70,
      disabledColor: ColorManager.grey1,
      shape: const StadiumBorder(),
    ),
    // elevated b theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularTextStyle(color: ColorManager.white),
        primary: ColorManager.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
      ),
    ),

    //  text      theme
    textTheme: TextTheme(
      headline1: getSemiBoldTextStyle(
          color: ColorManager.darkGrey, fontSize: FontSize.s16),
      subtitle1: getMediumTextStyle(
          color: ColorManager.lightGrey, fontSize: FontSize.s14),
      caption: getRegularTextStyle(color: ColorManager.grey1),
      bodyText2: getRegularTextStyle(color: ColorManager.grey),
    ),
    //  input decoration theme(text from field)
  );
}
