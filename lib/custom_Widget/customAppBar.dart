import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  String title;
  CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
    );
  }
}
