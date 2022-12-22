import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:practice_project/custom_Widget/customAppBar.dart';

class AnimatedOpacityWidget extends StatefulWidget {
  const AnimatedOpacityWidget({Key? key}) : super(key: key);

  @override
  State<AnimatedOpacityWidget> createState() => _AnimatedOpacityWidgetState();
}

class _AnimatedOpacityWidgetState extends State<AnimatedOpacityWidget> {
  var _opacity = 0.0;
  var _width = 230.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: CustomAppBar(title: "Animated Opacity")),
      body: GestureDetector(
        onTap: () {
          setState(() {
            _opacity = _opacity == 0.0 ? 1.0 : 0.0;
          });
        },
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          height: MediaQuery.of(context).size.height * 0.08,
          width: _width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.cyan[400],
          ),
          child: AnimatedOpacity(
            opacity: _opacity,
            curve: Curves.bounceIn,
            duration: const Duration(microseconds: 700),
            child: Row(children: [
              Image.network(
                'https://images.pexels.com/photos/624015/pexels-photo-624015.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                scale: 20,
                fit: BoxFit.contain,
              ),
              const SizedBox(
                width: 30,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 30.0),
                child: Text(
                  'Flutter Devs',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
