// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';

BoxDecoration baseShadowDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(15),
  color: Colors.white,
  border: Border.all(
    color: Colors.white,
    width: 2.0,
  ),
  boxShadow: [
    CustomBoxShadow(
        color: Colors.black.withOpacity(0.2),
        offset: const Offset(0.0, 0.0),
        blurRadius: 8.0,
        blurStyle: BlurStyle.outer)
  ],
);

BoxDecoration shadowDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(5),
  color: Colors.white,
  border: Border.all(
    color: Colors.white,
    width: 2.0,
  ),
  boxShadow: [
    CustomBoxShadow(
        color: Colors.black.withOpacity(0.3),
        offset: const Offset(0.0, 0.0),
        blurRadius: 4.0,
        blurStyle: BlurStyle.outer)
  ],
);

class CustomBoxShadow extends BoxShadow {
  @override
  final BlurStyle blurStyle;

  const CustomBoxShadow({
    Color color = const Color(0xFF000000),
    Offset offset = Offset.zero,
    double blurRadius = 0.0,
    this.blurStyle = BlurStyle.outer,
  }) : super(color: color, offset: offset, blurRadius: blurRadius);

  @override
  Paint toPaint() {
    final Paint result = Paint()
      ..color = color
      ..maskFilter = MaskFilter.blur(blurStyle, blurSigma);
    assert(() {
      if (debugDisableShadows) result.maskFilter = null;
      return true;
    }());
    return result;
  }
}
