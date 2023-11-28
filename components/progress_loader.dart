import 'package:flutter/material.dart';

import '../theme.dart';

class ProgressLoader extends StatefulWidget {
  final VoidCallback? onTap;
  final String text;
  final bool isShowText;

  const ProgressLoader({
    Key? key,
    this.onTap,
    this.text = "Loading...",
    this.isShowText = true,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => ProgressLoaderState();
}

class ProgressLoaderState extends State<ProgressLoader>
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
              width: 100,
              height: 100,
              decoration: ShapeDecoration(
                  color: MyTheme.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0))),
              child: Center(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircularProgressIndicator(
                        backgroundColor: Colors.white,
                      ),
                      if (widget.isShowText)
                        Container(
                            margin: const EdgeInsets.only(top: 10),
                            child: Text(widget.text))
                    ]),
              )),
        ),
      ),
    );
  }
}
