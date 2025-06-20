import 'package:flutter/material.dart';

extension MediaQueryValues on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  double get statusBarSize => MediaQuery.of(this).padding.top;
  double get appBarSize => statusBarSize + kToolbarHeight;
  double get mainHeight => height - statusBarSize;
  double get heightOfScreenOnly => height - appBarSize;
  bool get isTablet => width >= 600;
}

extension TextThemeExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  TextStyle get labelSmall => textTheme.labelSmall!;
  TextStyle get labelLarge => textTheme.labelLarge!;
  TextStyle get bodySmall => textTheme.bodySmall!;
  TextStyle get bodyLarge => textTheme.bodyLarge!;
  TextStyle get titleSmall => textTheme.titleSmall!;
  TextStyle get titleMedium => textTheme.titleMedium!;
  TextStyle get titleLarge => textTheme.titleLarge!;
  TextStyle get headlineSmall => textTheme.headlineSmall!;
  TextStyle get headlineLarge => textTheme.headlineLarge!;
  TextStyle get displaySmall => textTheme.displaySmall!;
  TextStyle get displayLarge => textTheme.displayLarge!;
}
