import 'package:flutter/material.dart';
import 'package:practice_project/custom_Widget/customAppBar.dart';

class AnimatedPhysicalModelWIdget extends StatefulWidget {
  const AnimatedPhysicalModelWIdget({Key? key}) : super(key: key);

  @override
  State<AnimatedPhysicalModelWIdget> createState() => _AnimatedPhysicalModelWIdgetState();
}

class _AnimatedPhysicalModelWIdgetState extends State<AnimatedPhysicalModelWIdget> {
  bool _first = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: const Size.fromHeight(60), child: CustomAppBar(title: "Animated Physical Model")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: AnimatedPhysicalModel(
              duration: const Duration(milliseconds: 500),
              curve: Curves.fastOutSlowIn,
              elevation: _first ? 0 : 6.0,
              shape: BoxShape.rectangle,
              shadowColor: Colors.black,
              color: Colors.white,
              borderRadius: _first ? const BorderRadius.all(Radius.circular(0)) : const BorderRadius.all(Radius.circular(10)),
              child: Container(
                height: 120.0,
                width: 120.0,
                color: Colors.blue[50],
                child: const FlutterLogo(
                  size: 60,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            child: const Text('Click Me!'),
            onPressed: () {
              setState(() {
                _first = !_first;
              });
            },
          ),
        ],
      ),
    );
  }
}
