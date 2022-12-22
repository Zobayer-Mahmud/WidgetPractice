import 'package:flutter/material.dart';
import 'dart:math' as math;
class AnimatedBuilderWidget extends StatefulWidget {
  const AnimatedBuilderWidget({Key? key}) : super(key: key);

  @override
  State<AnimatedBuilderWidget> createState() => _AnimatedBuilderWidgetState();
}

class _AnimatedBuilderWidgetState extends State<AnimatedBuilderWidget> with TickerProviderStateMixin{
  late final AnimationController animationController =
   AnimationController(vsync: this,duration: const Duration(seconds: 10));
  @override
  void dispose(){
    animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Animated Widget"),elevation: 2,centerTitle: true,),
      backgroundColor: Colors.blue.withOpacity(0.5),
      body: Center(
        child: AnimatedBuilder(animation: animationController, 
        child:  const FlutterLogo(
          size: 100,
        ),
        builder: 
        (BuildContext context, Widget? child ){
          // return Transform.scale(alignment: Alignment.center,child: Text("hello",),scaleX: 10,scaleY: 10,
          // transformHitTests: false,);
   return Transform.translate(offset: const Offset(10, 20),child: Text("Hello"),);

          // return Transform.rotate(angle: animationController.value *1.0 * math.pi ,child: child,
          // );
        }),
      ),
    );
    
    
  }
}