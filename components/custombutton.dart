// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../custom/custom_decorations.dart';
import '../theme.dart';

class CustomButton extends StatefulWidget {
  final VoidCallback onTap;
  final String title;
  final bool showRightIcon;
  final IconData rightIcon;
  final Color rightIconColor;
  const CustomButton({
    Key? key,
    required this.onTap,
    required this.title,
    this.showRightIcon = false,
    this.rightIcon = Icons.chevron_right,
    this.rightIconColor = Colors.white,
  }) : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: const BoxDecoration(
        color: MyTheme.themeGray,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: widget.onTap,
        child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Text(
                    widget.title,
                    style: TextStyle(
                        color: MyTheme.white,
                        fontSize: MyFonts.subheading1,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.none),
                  ),
                ),
                const Spacer(),
                Visibility(
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  visible: widget.showRightIcon,
                  child: Icon(
                    widget.rightIcon,
                    color: widget.rightIconColor,
                    size: 30.0,
                  ),
                )
              ],
            )),
      ),
    );
  }
}

class ButtonFilled extends StatefulWidget {
  final VoidCallback onTap;
  final String title;
  final double width;
  final double height;
  final double fontSize;
  final Color titleColor;
  final bool showIcon;
  final IconData? icon;
  final Color iconColor;
  const ButtonFilled({
    Key? key,
    required this.onTap,
    required this.title,
    required this.width,
    this.height = 45,
    this.titleColor = MyTheme.THEMECOLOR,
    this.fontSize = 0,
    this.showIcon = false,
    this.icon,
    this.iconColor = Colors.grey,
  }) : super(key: key);

  @override
  _ButtonFilledState createState() => _ButtonFilledState();
}

class _ButtonFilledState extends State<ButtonFilled> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.onTap,
        child: Container(
          height: widget.height,
          width: widget.width,
          decoration: baseShadowDecoration,
          alignment: Alignment.center,
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            if (widget.icon != null)
              Icon(
                widget.icon,
                color: widget.iconColor,
                size: 20.0,
              ),
            if (widget.icon != null) const SizedBox(width: 10),
            Text(widget.title,
                style: TextStyle(
                    fontSize: widget.fontSize != 0
                        ? widget.fontSize
                        : MyFonts.buttonTitle,
                    color: widget.titleColor,
                    fontWeight: FontWeight.w600))
          ]),
        ));
  }
}

class ButtonOutlined extends StatefulWidget {
  final VoidCallback onTap;
  final String title;
  final double width;
  final double height;
  final Color color;

  const ButtonOutlined(
      {Key? key,
      required this.onTap,
      required this.title,
      required this.width,
      this.height = 40,
      this.color = MyTheme.THEMECOLOR})
      : super(key: key);

  @override
  _ButtonOutlinedState createState() => _ButtonOutlinedState();
}

class _ButtonOutlinedState extends State<ButtonOutlined> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.onTap,
        child: Container(
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white.withOpacity(0),
            border: Border.all(
              color: widget.color,
              width: 1.0,
            ),
          ),
          alignment: Alignment.center,
          child: Text(widget.title,
              style: TextStyle(
                  fontSize: MyFonts.buttonTitle,
                  color: widget.color,
                  fontWeight: FontWeight.w600)),
        ));
  }
}

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return GestureDetector(
      onTap: () => {Navigator.pop(context)},
      child: Container(
          alignment: Alignment.center,
          height: 30,
          width: 30,
          child: Icon(
            Icons.arrow_back,
            color: isDarkMode ? Colors.white : Colors.black,
            size: 28,
          )),
    );
  }
}

class ButtonWithIcon extends StatefulWidget {
  final VoidCallback onTap;
  final IconData icon;
  final Color iconColor;
  const ButtonWithIcon(
      {Key? key,
      required this.onTap,
      required this.icon,
      this.iconColor = Colors.white})
      : super(key: key);

  @override
  _ButtonWithIconState createState() => _ButtonWithIconState();
}

class _ButtonWithIconState extends State<ButtonWithIcon> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Icon(
        widget.icon,
        color: widget.iconColor,
        size: 30.0,
      ),
    );
  }
}

class ButtonText extends StatefulWidget {
  final VoidCallback onTap;
  final String title;
  final double width;
  final double height;
  final TextStyle textStyle;
  final Color color;

  const ButtonText(
      {Key? key,
      required this.onTap,
      required this.title,
      this.width = 0,
      this.height = 60,
      this.textStyle =
          const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
      this.color = MyTheme.THEMECOLOR})
      : super(key: key);

  @override
  _ButtonTextState createState() => _ButtonTextState();
}

class _ButtonTextState extends State<ButtonText> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: widget.height,
        width: widget.width != 0 ? widget.width : null,
        child: TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(widget.color),
          ),
          onPressed: widget.onTap,
          child: SizedBox(
            width: widget.width != 0 ? widget.width : null,
            child: Text(
              widget.title,
              style: widget.textStyle,
            ),
          ),
        ));
  }
}
