import 'package:flutter/material.dart';
import 'package:practice_project/custom_Widget/customAppBar.dart';

class AnimatedPaddingWidget extends StatefulWidget {
  const AnimatedPaddingWidget({Key? key}) : super(key: key);

  @override
  State<AnimatedPaddingWidget> createState() => _AnimatedPaddingWidgetState();
}

class _AnimatedPaddingWidgetState extends State<AnimatedPaddingWidget> {
  double _padding = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: CustomAppBar(title: "Animated Padding")),
      body: Center(
        child: AnimatedPadding(
          padding: EdgeInsets.all(_padding),
          duration: Duration(milliseconds: 1000),
          child: GestureDetector(
            onTap: (() {
              setState(() {
                _padding = _padding == 10 ? 100 : 10;
              });
            }),
            child: Container(
              height: 100,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
