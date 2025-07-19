import 'package:flutter/material.dart';
import 'package:stackfood/src/core/ui/theme/app_colors.dart';
import 'package:stackfood/src/core/ui/typography/font_weights.dart';

class AppTextStyles {
  /// Base text style with dynamic color from the theme's color scheme
  static TextStyle get _baseTextStyle {
    return TextStyle(
      fontFamily: 'Fustat',
      fontWeight: AppFontWeight.regular,
    ).copyWith(
      color: AppColors.black, // Dynamic color
    );
  }

  ///32 700
  static TextStyle get headline1 {
    return _baseTextStyle.copyWith(
      fontSize: 32,
      fontWeight: AppFontWeight.bold,
    );
  }

  ///24 600
  static TextStyle get headline2 {
    return _baseTextStyle.copyWith(
      fontSize: 24,
      fontWeight: AppFontWeight.semiBold,
    );
  }

  ///22 600
  static TextStyle get headline3 {
    return _baseTextStyle.copyWith(
      fontSize: 22,
      fontWeight: AppFontWeight.semiBold,
    );
  }

  ///20 600
  static TextStyle get headline4 {
    return _baseTextStyle.copyWith(
      fontSize: 20,
      fontWeight: AppFontWeight.semiBold,
    );
  }

  ///18 600
  static TextStyle get headline5 {
    return _baseTextStyle.copyWith(
      fontSize: 18,
      fontWeight: AppFontWeight.semiBold,
    );
  }

  ///16 700
  static TextStyle get headline6 {
    return _baseTextStyle.copyWith(
      fontSize: 16,
      fontWeight: AppFontWeight.semiBold,
    );
  }

  ///16 700
  static TextStyle get bodyText1 {
    return _baseTextStyle.copyWith(
      fontSize: 16,
      fontWeight: AppFontWeight.bold,
    );
  }

  ///16 600
  static TextStyle get bodyText2 {
    return _baseTextStyle.copyWith(
      fontSize: 16,
      fontWeight: AppFontWeight.semiBold,
    );
  }

  ///14 700
  static TextStyle get subtitle1 {
    return _baseTextStyle.copyWith(
      fontSize: 14,
      fontWeight: AppFontWeight.bold,
    );
  }

  ///14 600
  static TextStyle get subtitle2 {
    return _baseTextStyle.copyWith(
      fontSize: 14,
      fontWeight: AppFontWeight.semiBold,
    );
  }

  ///12 700
  static TextStyle get caption {
    return _baseTextStyle.copyWith(
      fontSize: 12,
      fontWeight: AppFontWeight.bold,
    );
  }

  ///12 600
  static TextStyle get caption2 {
    return _baseTextStyle.copyWith(
      fontSize: 12,
      fontWeight: AppFontWeight.semiBold,
    );
  }

  ///18 500
  static TextStyle get button {
    return _baseTextStyle.copyWith(
      fontSize: 18,
      fontWeight: AppFontWeight.medium,
    );
  }

  ///16 400
  static TextStyle get overLine {
    return _baseTextStyle.copyWith(
      fontSize: 16,
      fontWeight: AppFontWeight.regular,
    );
  }
}
