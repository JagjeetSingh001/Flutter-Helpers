import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

extension DarkMode on BuildContext {
  /// is dark mode currently enabled?
  bool get isDarkMode {
    final brightness = MediaQuery.of(this).platformBrightness;
    return brightness == Brightness.dark;
  }
}

var brightness =
    SchedulerBinding.instance.platformDispatcher.platformBrightness;
bool isDarkMode = brightness == Brightness.dark;

class MyTheme {
  BuildContext? context;

  MyTheme({Key? key, required this.context});

  /*configurable colors stars*/
  // ignore: non_constant_identifier_names, constant_identifier_names
  static const Color THEMECOLOR = Color.fromRGBO(1, 178, 254, 1);
  static Color bgcolor = const Color.fromRGBO(233, 233, 233, 1);
  static const Color themeGray = Color.fromRGBO(39, 39, 39, 1);
  static const Color gray133 = Color.fromRGBO(133, 133, 151, 1);
  static const Color gray244 = Color.fromRGBO(244, 243, 253, 1);
  static const Color gray184 = Color.fromRGBO(184, 184, 210, 1);
  static const Color lightBlue = Color.fromRGBO(206, 236, 254, 1);
  static const Color lightPink = Color.fromRGBO(239, 224, 255, 1);
  static const Color pink = Color.fromRGBO(144, 101, 190, 1);
  static Color darkRed = const Color.fromRGBO(121, 37, 38, 1);
  static Color red = const Color.fromRGBO(255, 47, 47, 1);
  static Color green = const Color.fromRGBO(47, 255, 80, 1);
  static Color yellow = const Color.fromRGBO(255, 211, 1, 1);
  // static Color soft_accent_color = Color.fromRGBO(247, 189, 168, 1);
  // static Color splash_screen_color = Color.fromRGBO(
  // 230, 46, 4, 1); // if not sure , use the same color as accent color
  /*configurable colors ends*/

  /*If you are not a developer, do not change the bottom colors*/
  static Color textColor = isDarkMode
      ? const Color.fromRGBO(255, 255, 255, 1)
      : const Color.fromRGBO(31, 31, 57, 1);
  static Color darkColor = const Color.fromRGBO(53, 53, 53, 1);
  static Color dark31 = const Color.fromRGBO(31, 31, 57, 1);
  static Color skyBlueolor = const Color.fromRGBO(120, 168, 213, 1);
  static Color black = isDarkMode
      ? const Color.fromRGBO(255, 255, 255, 1)
      : const Color.fromRGBO(0, 0, 0, 1);
  static Color headingColor = const Color.fromRGBO(54, 77, 118, 1);
  static Color placeholderColor = isDarkMode
      ? const Color.fromRGBO(244, 243, 253, 1)
      : const Color.fromRGBO(74, 74, 84, 0.6);
  static Color inputBorderColor = isDarkMode
      ? const Color.fromRGBO(244, 243, 253, 1)
      : const Color.fromRGBO(74, 74, 84, 0.6);
  static const Color orangeColor = Color.fromRGBO(255, 105, 5, 1);
  static Color white = const Color.fromRGBO(255, 255, 255, 1);
  static Color lightGrey = const Color.fromRGBO(242, 242, 242, 1);
  static Color darkGrey = const Color.fromRGBO(112, 112, 112, 1);
  static Color mediumGrey = const Color.fromRGBO(132, 132, 132, 1);
  static Color grey153 = const Color.fromRGBO(153, 153, 153, 1);
  static Color fontGrey = const Color.fromRGBO(73, 73, 73, 1);
  static Color textfieldGrey = const Color.fromRGBO(209, 209, 209, 1);
  static Color textfieldBg = const Color.fromRGBO(66, 66, 66, 1);
  static Color golden = const Color.fromRGBO(248, 181, 91, 1);
  static Color shimmerBase = Colors.grey.shade50;
  static Color shimmerHighlighted = Colors.grey.shade200;
  static Color clear = const Color.fromRGBO(255, 255, 255, 0);
  static Color shadow = const Color.fromRGBO(255, 255, 255, 0.02);

  //testing shimmer
  /*static Color shimmer_base = Colors.redAccent;
  static Color shimmer_highlighted = Colors.yellow;*/
}

class MyFonts {
  static double heading1 = 35;
  static double heading2 = 24;
  static double heading3 = 20;
  static double heading4 = 18;
  static double subheading1 = 15;
  static double body1 = 16;
  static double body2 = 14;
  static double body3 = 12;
  static double buttonTitle = 15;
  static double textFiledFontSize = 15;
}

class MyTextStyle {
  static var heading3Bold = TextStyle(
      color: MyTheme.white,
      fontSize: MyFonts.heading3,
      fontWeight: FontWeight.bold);
  static var appName24w400 = const TextStyle(
      color: MyTheme.THEMECOLOR,
      fontSize: 25,
      fontWeight: FontWeight.w400,
      fontFamily: 'ZenDots');
  static var appName15w400 = const TextStyle(
      color: MyTheme.THEMECOLOR,
      fontSize: 15,
      fontWeight: FontWeight.w400,
      fontFamily: 'ZenDots');
  static var subheading1 =
      TextStyle(color: MyTheme.white, fontSize: MyFonts.subheading1);

  static var heading32w600 = TextStyle(
      color: MyTheme.headingColor, fontSize: 32, fontWeight: FontWeight.w600);
  static var heading34w600 = TextStyle(
      color: MyTheme.headingColor, fontSize: 34, fontWeight: FontWeight.w600);

  static var heading24w600 = TextStyle(
      color: MyTheme.headingColor, fontSize: 24, fontWeight: FontWeight.w600);
  static var heading20w600 = TextStyle(
      color: MyTheme.textColor, fontSize: 20, fontWeight: FontWeight.w600);
  static var heading16w500 = TextStyle(
      color: MyTheme.headingColor, fontSize: 16, fontWeight: FontWeight.w500);
  static var textTheme12w400 = const TextStyle(
      color: MyTheme.THEMECOLOR, fontSize: 12, fontWeight: FontWeight.w400);
  static var textTheme16w700 = const TextStyle(
      color: MyTheme.THEMECOLOR, fontSize: 16, fontWeight: FontWeight.w700);
  static var textTheme18w400 = const TextStyle(
      color: MyTheme.THEMECOLOR, fontSize: 18, fontWeight: FontWeight.w400);
  static var textTheme24w500 = const TextStyle(
      color: MyTheme.THEMECOLOR, fontSize: 24, fontWeight: FontWeight.w500);
  static var textTheme20w700 = const TextStyle(
      color: MyTheme.THEMECOLOR, fontSize: 20, fontWeight: FontWeight.w700);
  static var text32w600 = TextStyle(
      color: MyTheme.textColor, fontSize: 32, fontWeight: FontWeight.w600);
  static var text36w700 = TextStyle(
      color: MyTheme.textColor, fontSize: 36, fontWeight: FontWeight.w700);
  static var text11w700 = TextStyle(
      color: MyTheme.textColor, fontSize: 11, fontWeight: FontWeight.w700);
  static var text12w400 = TextStyle(
      color: MyTheme.textColor, fontSize: 12, fontWeight: FontWeight.w400);
  static var text12w500 = TextStyle(
      color: MyTheme.textColor, fontSize: 12, fontWeight: FontWeight.w500);
  static var text12w600 = TextStyle(
      color: MyTheme.textColor, fontSize: 12, fontWeight: FontWeight.w600);
  static var text24w400 = TextStyle(
      color: MyTheme.textColor, fontSize: 24, fontWeight: FontWeight.w400);
  static var text24w600 = TextStyle(
      color: MyTheme.textColor, fontSize: 24, fontWeight: FontWeight.w600);
  static var text22w600 = TextStyle(
      color: MyTheme.textColor, fontSize: 22, fontWeight: FontWeight.w600);
  static var text20w500 = TextStyle(
      color: MyTheme.textColor, fontSize: 20, fontWeight: FontWeight.w500);
  static var text20w600 = TextStyle(
      color: MyTheme.textColor, fontSize: 20, fontWeight: FontWeight.w600);
  static var text20w700 = TextStyle(
      color: MyTheme.textColor, fontSize: 20, fontWeight: FontWeight.w700);
  static var text18w500 = TextStyle(
      color: MyTheme.textColor, fontSize: 18, fontWeight: FontWeight.w500);
  static var text18w700 = TextStyle(
      color: MyTheme.textColor, fontSize: 18, fontWeight: FontWeight.w700);
  static var textGray14w400 = const TextStyle(
      color: MyTheme.gray184, fontSize: 14, fontWeight: FontWeight.w400);
  static var textGray16w400 = const TextStyle(
      color: MyTheme.gray184, fontSize: 16, fontWeight: FontWeight.w400);
  static var textGray18w400 = const TextStyle(
      color: MyTheme.gray184, fontSize: 18, fontWeight: FontWeight.w400);
  static var text14w400 = TextStyle(
      color: MyTheme.textColor, fontSize: 14, fontWeight: FontWeight.w400);
  static var text14w500 = TextStyle(
      color: MyTheme.textColor, fontSize: 14, fontWeight: FontWeight.w500);
  static var text15w400 = TextStyle(
      color: MyTheme.textColor, fontSize: 15, fontWeight: FontWeight.w400);
  static var text15w500 = TextStyle(
      color: MyTheme.textColor, fontSize: 15, fontWeight: FontWeight.w500);
  static var text16w400 = TextStyle(
      color: MyTheme.textColor, fontSize: 16, fontWeight: FontWeight.w400);
  static var text16w500 = TextStyle(
      color: MyTheme.textColor, fontSize: 16, fontWeight: FontWeight.w500);
  static var text16w600 = TextStyle(
      color: MyTheme.textColor, fontSize: 16, fontWeight: FontWeight.w600);
  static var text16w700 = TextStyle(
      color: MyTheme.textColor, fontSize: 16, fontWeight: FontWeight.w700);
  static var textDark20w700 = TextStyle(
      color: MyTheme.dark31, fontSize: 20, fontWeight: FontWeight.w700);
  static var textBlack31w400 = TextStyle(
      color: MyTheme.textColor, fontSize: 31, fontWeight: FontWeight.w400);
  static var textGray31w400 = const TextStyle(
      color: MyTheme.gray133, fontSize: 18, fontWeight: FontWeight.w400);
  static var textGray12w400 = const TextStyle(
      color: MyTheme.gray133, fontSize: 12, fontWeight: FontWeight.w400);
  static var textGray10w400 = const TextStyle(
      color: MyTheme.gray133, fontSize: 10, fontWeight: FontWeight.w400);
  static var textGreen15w600 = TextStyle(
      color: MyTheme.green, fontSize: 15, fontWeight: FontWeight.w600);
  static var textRed15w600 =
      TextStyle(color: MyTheme.red, fontSize: 15, fontWeight: FontWeight.w600);
  static var textGray24w500 = const TextStyle(
      color: MyTheme.gray184, fontSize: 24, fontWeight: FontWeight.w500);
  static var textGray12w500 = TextStyle(
      color: MyTheme.darkGrey, fontSize: 12, fontWeight: FontWeight.w500);
  static var textTheme12w500 = const TextStyle(
      color: MyTheme.THEMECOLOR, fontSize: 12, fontWeight: FontWeight.w500);
  static var textThemek13w500 = const TextStyle(
      color: MyTheme.THEMECOLOR, fontSize: 13, fontWeight: FontWeight.w500);
  static var textThemek15w400 = const TextStyle(
      color: MyTheme.THEMECOLOR, fontSize: 15, fontWeight: FontWeight.w400);
  static var textThemek15w500 = const TextStyle(
      color: MyTheme.THEMECOLOR, fontSize: 15, fontWeight: FontWeight.w500);

  static var textWhite13w700 = TextStyle(
      color: MyTheme.white, fontSize: 13, fontWeight: FontWeight.w700);
  static var textWhite15w600 = TextStyle(
      color: MyTheme.white, fontSize: 15, fontWeight: FontWeight.w600);
  static var textWhite25w600 = TextStyle(
      color: MyTheme.white, fontSize: 25, fontWeight: FontWeight.w600);
  static var textWhite36w600 = TextStyle(
      color: MyTheme.white, fontSize: 36, fontWeight: FontWeight.w600);
  static var textWhite18w500 = TextStyle(
      color: MyTheme.white, fontSize: 18, fontWeight: FontWeight.w500);
  static var textWhite18w600 = TextStyle(
      color: MyTheme.white, fontSize: 18, fontWeight: FontWeight.w600);
  static var textBlack13w400 = TextStyle(
      color: MyTheme.black, fontSize: 13, fontWeight: FontWeight.w400);
  static var textBlack16w700 = TextStyle(
      color: MyTheme.black, fontSize: 16, fontWeight: FontWeight.w700);
  static var textBlack25w700 = TextStyle(
      color: MyTheme.black, fontSize: 25, fontWeight: FontWeight.w700);
  static var textBlack30w500 = TextStyle(
      color: MyTheme.black, fontSize: 30, fontWeight: FontWeight.w500);
  static var textBlack30w600 = TextStyle(
      color: MyTheme.black, fontSize: 30, fontWeight: FontWeight.w600);
  static var textBlack30w700 = TextStyle(
      color: MyTheme.black, fontSize: 30, fontWeight: FontWeight.w700);
  static var textBlack20w600 = TextStyle(
      color: MyTheme.black, fontSize: 20, fontWeight: FontWeight.w600);
  static var textBlack23w600 = TextStyle(
      color: MyTheme.black, fontSize: 23, fontWeight: FontWeight.w600);
  static var textBlack16w500 = TextStyle(
      color: MyTheme.black, fontSize: 16, fontWeight: FontWeight.w500);
  static var textdark18w500 = TextStyle(
      color: MyTheme.darkColor, fontSize: 18, fontWeight: FontWeight.w500);
}
