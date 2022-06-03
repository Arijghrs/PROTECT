import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HeartLine extends StatefulWidget {
  const HeartLine({Key? key}) : super(key: key);

  @override
  State<HeartLine> createState() => _HeartLineState();
}

class _HeartLineState extends State<HeartLine>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> animation;
  @override
  void initState() {
    animationController = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2),
        value: 0.05,
        lowerBound: 0.05,
        upperBound: 0.75);
    animation = Tween<Offset>(
            begin: const Offset(0, 0.0), end: const Offset(0, 0.0))
        .animate(animationController);
    animationController.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      child: Lottie.asset("assets/lottie/lf30_editor_aanzrwlt.json",
          alignment: Alignment.center,
          addRepaintBoundary: true,
          animate: true,
          fit: BoxFit.fill,
          repeat: true),
      builder: (BuildContext context, Widget? child) {
        return SlideTransition(
          position: animation,
          child: child!,
        );
      },
    );
  }
}
