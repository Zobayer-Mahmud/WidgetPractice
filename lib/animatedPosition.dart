import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:practice_project/custom_Widget/customAppBar.dart';

class AnimatedPositonWidget extends StatefulWidget {
  const AnimatedPositonWidget({Key? key}) : super(key: key);

  @override
  State<AnimatedPositonWidget> createState() => _AnimatedPositonWidgetState();
}

class _AnimatedPositonWidgetState extends State<AnimatedPositonWidget> with SingleTickerProviderStateMixin {
  bool isLeftCollapsed = true;
  bool isRightCollapsed = true;
  bool isTopCollapsed = true;
  bool isBottomCollapsed = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(title: 'Animated Position'),
      ),
      body: Column(),
    );
  }
}
