import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimatedHeartBeat extends StatefulWidget {
  const AnimatedHeartBeat({Key? key}) : super(key: key);

  @override
  State<AnimatedHeartBeat> createState() => _AnimatedHeartBeatState();
}

class _AnimatedHeartBeatState extends State<AnimatedHeartBeat>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2),
        value: 0.05,
        lowerBound: 0.05,
        upperBound: 0.75);
   animationController.repeat();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Lottie.asset("assets/lottie/lf30_editor_krhyyxjk.json",
        alignment: Alignment.center,
        addRepaintBoundary: true,
        controller: animationController.view,
        animate: true,
        repeat: true);
  }
}
