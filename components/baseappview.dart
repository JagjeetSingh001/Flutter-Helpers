import 'package:flutter/material.dart';

import '../theme.dart';
import 'custombutton.dart';

class BaseAppView extends StatelessWidget {
  final List<Widget> children;
  final double leftPadding;
  final double topPadding;
  final double rightPadding;
  final CrossAxisAlignment crossAxisAlignment;
  const BaseAppView(
      {super.key,
      required this.children,
      this.leftPadding = 20,
      this.rightPadding = 20,
      this.topPadding = 10,
      this.crossAxisAlignment = CrossAxisAlignment.start});

  @override
  Widget build(BuildContext context) {
    var statusBarHeigt = MediaQuery.of(context).viewPadding.top;

    return Stack(children: [
      const BaseBackgroundContainer(),
      Padding(
          padding: EdgeInsets.only(
              top: statusBarHeigt + topPadding,
              bottom: 0,
              left: leftPadding,
              right: rightPadding),
          child: Column(
              crossAxisAlignment: crossAxisAlignment, children: children))
    ]);
  }
}

class BaseAppScrollView extends StatelessWidget {
  final List<Widget> children;
  final double leftPadding;
  final double rightPadding;
  final double topPadding;
  final double bottomPadding;
  final CrossAxisAlignment crossAxisAlignment;

  const BaseAppScrollView(
      {super.key,
      required this.children,
      this.leftPadding = 20,
      this.rightPadding = 20,
      this.topPadding = 30,
      this.bottomPadding = 30,
      this.crossAxisAlignment = CrossAxisAlignment.start});

  @override
  Widget build(BuildContext context) {
    var statusBarHeigt = MediaQuery.of(context).viewPadding.top;

    return Stack(children: <Widget>[
      const BaseBackgroundContainer(),
      SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.only(
                  top: statusBarHeigt + topPadding,
                  bottom: bottomPadding,
                  left: leftPadding,
                  right: rightPadding),
              child: Column(
                  crossAxisAlignment: crossAxisAlignment, children: children)))
    ]);
  }
}

class BaseHeaderView extends StatelessWidget {
  final String title;
  final bool isShowBackButton;
  const BaseHeaderView(
      {Key? key, required this.title, this.isShowBackButton = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 30,
      child: Row(
        children: [
          if (isShowBackButton) const BackButtonWidget(),
          const SizedBox(width: 15),
          Text(
            title,
            style: MyTextStyle.heading20w600,
          )
        ],
      ),
    );
  }
}

class BaseBackgroundContainer extends StatelessWidget {
  const BaseBackgroundContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        // image: DecorationImage(
        //     image: AssetImage("assets/images/background.png"),
        //     fit: BoxFit.fill)),
        );
  }
}
