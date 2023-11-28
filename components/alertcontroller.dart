import 'package:flutter/material.dart';

import '../theme.dart';
import 'custombutton.dart';

class AlertController extends StatefulWidget {
  final VoidCallback? onTap;
  final VoidCallback? onCloseTap;
  final String title;
  final String message;
  final String buttonTitle;
  final bool hideCloseButton;
  const AlertController(
      {Key? key,
      this.onTap,
      required this.title,
      required this.message,
      this.buttonTitle = 'OK',
      this.onCloseTap,
      this.hideCloseButton = false})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => AlertControllerState();
}

class AlertControllerState extends State<AlertController>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
              margin: const EdgeInsets.all(20.0),
              width: MediaQuery.of(context).size.width * 0.85,
              height: 200.0,
              decoration: ShapeDecoration(
                  color: MyTheme.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0))),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        color: MyTheme.THEMECOLOR,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Text(widget.title,
                                  style: TextStyle(
                                      color: MyTheme.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600)),
                              const Spacer(),
                              if (!widget.hideCloseButton)
                                ButtonWithIcon(
                                    onTap: widget.onCloseTap ??
                                        () {
                                          Navigator.pop(context);
                                        },
                                    icon: Icons.close_sharp),
                            ],
                          ),
                        )),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 60,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Text(widget.message,
                            style: const TextStyle(
                                color: MyTheme.themeGray, fontSize: 15)),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      ButtonFilled(
                        height: 40,
                        onTap: widget.onTap ??
                            () {
                              Navigator.pop(context);
                            },
                        title: widget.buttonTitle,
                        width: MediaQuery.of(context).size.width * 0.35,
                      ),
                    ]),
                    const SizedBox(height: 10),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}

class AlertControllerTwoButtons extends StatefulWidget {
  final VoidCallback onTap;
  final String title;
  final String message;
  final String buttonTitle;
  final String cancelbuttonTitle;
  const AlertControllerTwoButtons(
      {Key? key,
      required this.onTap,
      required this.title,
      required this.message,
      required this.buttonTitle,
      required this.cancelbuttonTitle})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => AlertControllerTwoButtonsState();
}

class AlertControllerTwoButtonsState extends State<AlertControllerTwoButtons>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
              margin: const EdgeInsets.all(20.0),
              width: MediaQuery.of(context).size.width * 0.85,
              height: 250.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0)),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Text(widget.title,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600)),
                          const Spacer(),
                          ButtonWithIcon(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              icon: Icons.close_sharp,
                              iconColor: Colors.black),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 60,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Text(widget.message,
                            style: TextStyle(
                                color: MyTheme.themeGray,
                                fontSize: MyFonts.subheading1)),
                      ),
                    ),
                    const SizedBox(height: 35),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      ButtonFilled(
                        onTap: widget.onTap,
                        title: widget.buttonTitle,
                        width: MediaQuery.of(context).size.width * 0.35,
                      ),
                      const SizedBox(width: 15),
                      ButtonOutlined(
                        onTap: () => {Navigator.pop(context)},
                        title: widget.cancelbuttonTitle,
                        width: MediaQuery.of(context).size.width * 0.35,
                        color: MyTheme.THEMECOLOR,
                      ),
                    ]),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
