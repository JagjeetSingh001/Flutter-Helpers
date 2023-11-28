// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import '../theme.dart';

class InputDecorations {
  static InputDecoration buildInputDecoration_1(
      {hint_text = "", has_focused = false}) {
    return InputDecoration(
        fillColor: has_focused ? MyTheme.white : MyTheme.white,
        filled: true,
        hintText: hint_text,
        hintStyle: TextStyle(
            fontSize: MyFonts.textFiledFontSize,
            color: has_focused ? MyTheme.darkGrey : MyTheme.darkGrey),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: MyTheme.darkGrey, width: 1.5),
          borderRadius: const BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        contentPadding: const EdgeInsets.only(left: 16.0));
    // enabledBorder: OutlineInputBorder(
    //   borderSide: BorderSide(color: MyTheme.textfieldGrey, width: 0.5),
    //   borderRadius: const BorderRadius.all(
    //     Radius.circular(5.0),
    //   ),
    // ),
    //               // border: const OutlineInputBorder(),
    //               // enabledBorder: const OutlineInputBorder(
    //               //   borderSide:  BorderSide(color: Colors.red, width: 0.0),
    //               // ),
    //               focusedBorder: const OutlineInputBorder(
    //                 borderSide: BorderSide(color: Colors.red, width: 0.0),
    //               ),
    //               labelText: 'Input Email',
    //               hintText: 'Input Email',
    //               hintStyle:
    //                   const TextStyle(fontSize: 20.0, color: Colors.white),
    //               labelStyle:
    //                   const TextStyle(fontSize: 20.0, color: Colors.white),
  }

  static InputDecoration buildInputDecoration({hint_text = ""}) {
    return InputDecoration(
        labelText: hint_text,
        labelStyle: TextStyle(fontSize: 14.0, color: MyTheme.placeholderColor),
        floatingLabelStyle:
            const TextStyle(fontSize: 16.0, color: MyTheme.THEMECOLOR),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: MyTheme.inputBorderColor.withOpacity(0.1), width: 0.5),
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(5.0),
              bottomRight: Radius.circular(5.0)),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: MyTheme.inputBorderColor.withOpacity(0.3), width: 0.5),
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(5.0),
              bottomRight: Radius.circular(5.0)),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: MyTheme.inputBorderColor.withOpacity(0.5), width: 0.5),
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(5.0),
                bottomRight: Radius.circular(5.0))),
        contentPadding: const EdgeInsets.only(left: 16.0));
  }
}
