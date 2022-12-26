import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:practice_project/custom_Widget/customAppBar.dart';

class AnimatedPositionWidget extends StatefulWidget {
  const AnimatedPositionWidget({Key? key}) : super(key: key);

  @override
  State<AnimatedPositionWidget> createState() => _AnimatedPositionWidgetState();
}

class _AnimatedPositionWidgetState extends State<AnimatedPositionWidget> with SingleTickerProviderStateMixin {
  bool isLeftCollapsed = true;
  bool isRightCollapsed = true;
  bool isTopCollapsed = true;
  bool isBottomCollapsed = true;
  final Duration duration = const Duration(milliseconds: 300);
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: duration);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppBar(title: 'Animated Position'),
      ),
      body: Stack(
        children: [
          upperBar(),
          sideBar(),
          bottomBar(),
          AnimatedPositioned(
            child: dashboard(context),
            duration: duration,
            left: isLeftCollapsed ? 0 : 0.1 * screenWidth,
            right: isRightCollapsed ? 0 : -0.2 * screenWidth,
            top: isTopCollapsed ? 0 : 0.1 * screenHeight,
            bottom: isBottomCollapsed ? 0 : .1 * screenHeight,
          )
        ],
      ),
    );
  }

  Widget dashboard(context) {
    return SafeArea(
      child: Material(
        type: MaterialType.card,
        animationDuration: duration,
        elevation: 8,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: const Text('MarketWatch'),
            actions: [
              IconButton(
                icon: isTopCollapsed
                    ? Icon(
                        Icons.keyboard_arrow_down_outlined,
                        size: 40,
                        color: Colors.white,
                      )
                    : Icon(
                        Icons.keyboard_arrow_up_outlined,
                        size: 40,
                        color: Colors.white,
                      ),
                onPressed: () {
                  setState(() {
                    isTopCollapsed ? _controller.forward() : _controller.reverse();
                    isTopCollapsed = !isTopCollapsed;
                  });
                },
              )
            ],
            leading: IconButton(
                icon: isLeftCollapsed ? Icon(Icons.menu) : Icon(Icons.clear),
                onPressed: () {
                  setState(() {
                    if (isLeftCollapsed) {
                      _controller.forward();
                    } else {
                      _controller.reverse();
                    }
                    isTopCollapsed = !isTopCollapsed;
                    isLeftCollapsed = !isLeftCollapsed;
                    isBottomCollapsed = !isBottomCollapsed;
                  });
                }),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                isBottomCollapsed ? _controller.forward() : _controller.reverse();
                isBottomCollapsed = !isBottomCollapsed;
              });
            },
            child: isBottomCollapsed
                ? Icon(
                    Icons.keyboard_arrow_up_outlined,
                    size: 40,
                  )
                : Icon(
                    Icons.keyboard_arrow_down_outlined,
                    size: 40,
                  ),
          ),
        ),
      ),
    );
  }
}

bottomBar() {
  return Positioned(
    bottom: 10,
    left: 30,
    child: Row(
      children: [
        const Text(
          "Reset Password",
          style: TextStyle(color: Colors.grey, fontSize: 25),
        ),
        const SizedBox(
          width: 60,
        ),
        Container(
          width: 100,
          height: 40,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.blue),
          child: const Center(
            child: Text(
              "Log Out",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    ),
  );
}

Widget sideBar() {
  return Positioned(
      left: 30,
      top: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Home",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 25),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "My Account",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 25),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "My Orders",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 25),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Settings",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 25),
          ),
        ],
      ));
}

Widget upperBar() {
  return Positioned(
      top: 40,
      left: 30,
      child: Row(
        children: [
          const CircleAvatar(
            child: Icon(Icons.person_outline),
          ),
          const SizedBox(
            width: 10,
          ),
          const Text(
            "User name",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 80,
          ),
          Container(
            width: 100,
            height: 40,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.blue),
            child: const Center(
                child: Text(
              "View Profile",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )),
          )
        ],
      ));
}
