import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation bounceInOut;
  Animation easeInOutSine;
  Animation easeInCubic;
  Animation linear;

  Animation<double> sizeAnimation0;
  Animation<double> sizeAnimation;
  Animation<double> sizeAnimation2;
  Animation<double> sizeAnimation3;
  Animation<double> sizeAnimation4;

  Animation<double> opacityAnimation;

  Animatable<Color> colorAnimation;
  Animatable<Color> colorAnimation2;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 3), vsync: this);

    bounceInOut = CurvedAnimation(parent: controller, curve: Curves.bounceInOut);
    easeInOutSine =
        CurvedAnimation(parent: controller, curve: Curves.easeInOutSine);
    easeInCubic =
        CurvedAnimation(parent: controller, curve: Curves.easeInCubic);
    linear = CurvedAnimation(parent: controller, curve: Curves.linear);

    colorAnimation = TweenSequence<Color>(
      [
        TweenSequenceItem(
          weight: 1.0,
          tween: ColorTween(
            begin: Colors.blue,
            end: Colors.pinkAccent,
          ),
        ),
        TweenSequenceItem(
          weight: 1.0,
          tween: ColorTween(
            begin: Colors.pinkAccent,
            end: Colors.green,
          ),
        ),
        TweenSequenceItem(
          weight: 1.0,
          tween: ColorTween(
            begin: Colors.green,
            end: Colors.yellow,
          ),
        ),
      ],
    );
    colorAnimation2 = TweenSequence<Color>([
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: Colors.red,
          end: Colors.purple,
        ),
      )
    ]);
    sizeAnimation0 = Tween<double>(begin: 0, end: 20).animate(easeInOutSine)
      ..addListener(() {
        setState(() {});
      });
    sizeAnimation = Tween<double>(begin: 0, end: 250).animate(bounceInOut)
      ..addListener(() {
        setState(() {});
      });
    sizeAnimation2 = Tween<double>(begin: 0, end: 180).animate(linear)
      ..addListener(() {
        setState(() {});
      });
    sizeAnimation3 = Tween<double>(begin: 0, end: 200).animate(easeInOutSine)
      ..addListener(() {
        setState(() {});
      });
    sizeAnimation4 = Tween<double>(begin: 0, end: 120).animate(easeInCubic)
      ..addListener(() {
        setState(() {});
      });
    opacityAnimation = Tween<double>(begin: 0.1, end: 1).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.forward();
    controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(top: 25),
                    width: sizeAnimation.value,
                    height: sizeAnimation0.value,
                    color: Colors.blue,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(top: 25),
                    width: sizeAnimation2.value,
                    height: 30,
                    color:
                        Colors.orangeAccent.withOpacity(opacityAnimation.value),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(top: 25),
                    width: sizeAnimation3.value,
                    height: 30,
                    color: Colors.yellow,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(top: 25),
                    width: sizeAnimation2.value,
                    height: 30,
                    color: Colors.green,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(top: 25),
                    width: sizeAnimation4.value,
                    height: 30,
                    color: colorAnimation2
                        .evaluate(AlwaysStoppedAnimation(controller.value)),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(top: 25),
                    width: sizeAnimation3.value,
                    height: 30,
                    color: colorAnimation
                        .evaluate(AlwaysStoppedAnimation(controller.value)),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
