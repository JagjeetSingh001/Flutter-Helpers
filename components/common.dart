import 'package:flutter/material.dart';

class Saperator extends StatelessWidget {
  final double height;
  final double width;
  const Saperator({Key? key, this.height = 10, this.width = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
