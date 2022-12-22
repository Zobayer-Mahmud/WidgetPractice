import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class AnimatedCrossFadeWidget extends StatefulWidget {
  const AnimatedCrossFadeWidget({Key? key}) : super(key: key);

  @override
  State<AnimatedCrossFadeWidget> createState() => _AnimatedCrossFadeWidgetState();
}

class _AnimatedCrossFadeWidgetState extends State<AnimatedCrossFadeWidget> {
  bool selected = true;
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(title: Text("Animated Cross Fade Widget"),centerTitle: true,),
      
      body: Column(children: [
        GestureDetector(onTap: (() {
          setState(() {
            selected =!selected;
          });
        }),
        child: Center(child: Text("Switch")),),
        AnimatedCrossFade(firstChild: Icon(Icons.phone), secondChild: Icon(Icons.email),
         crossFadeState: selected? CrossFadeState.showFirst :CrossFadeState.showSecond,
          duration: Duration(microseconds: 100))

        
      ]));
      
  }
}