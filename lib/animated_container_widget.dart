import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AnimatedContainerWidget extends StatefulWidget {
  const AnimatedContainerWidget({Key? key}) : super(key: key);

  @override
  State<AnimatedContainerWidget> createState() => _AnimatedContainerWidgetState();
}

class _AnimatedContainerWidgetState extends State<AnimatedContainerWidget> {
  bool selected =false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(title: Text("Animated Container Widget"),centerTitle: true,),
      body: Center(child: GestureDetector(onTap:(() {
        setState(() {
          selected = !selected;
        });
      }),
      child: AnimatedContainer(
        alignment: selected?Alignment.center:Alignment.topCenter,
        width: selected? 200: 100,
                height: selected? 100: 200,
                color:  selected? Colors.blueGrey : Colors.white,

        duration: Duration(seconds: 2,),curve: Curves.easeIn,),),),
    );
  }
}