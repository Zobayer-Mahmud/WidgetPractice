import 'package:flutter/material.dart';
import 'package:practice_project/animatedBuilderWidget.dart';
import 'package:practice_project/animatedCrossFadeWidget.dart';
import 'package:practice_project/animatedPadding.dart';
import 'package:practice_project/animatedPhysicalModel.dart';
import 'package:practice_project/animatedPosition.dart';
import 'package:practice_project/animated_container_widget.dart';
import 'package:practice_project/animated_opacity_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      debugShowCheckedModeBanner: false,
      home: const AnimatedPositonWidget(),
    );
  }
}
