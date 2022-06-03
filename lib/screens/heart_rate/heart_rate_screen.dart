import 'package:flutter/material.dart';
import 'package:protect/screens/heart_rate/widgets/animated_heartbeat.dart';
import 'package:protect/screens/heart_rate/widgets/animated_line_heartbeat.dart';
import 'package:protect/screens/heart_rate/widgets/beats_per_minute.dart';

class HeartRate extends StatefulWidget {
  const HeartRate({Key? key}) : super(key: key);

  @override
  State<HeartRate> createState() => _HeartRateState();
}

class _HeartRateState extends State<HeartRate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        backgroundColor: Colors.orange,
        title: const Text("HeartRate"),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: Column(
          children: const [
            SizedBox(
              height: 40,
            ),
            Expanded(child: AnimatedHeartBeat()),
            SizedBox(
              height: 40,
            ),
            Expanded(child: BeatsPerMinute()),
            Expanded(flex: 2, child: HeartLine()),
          ],
        ),
      ),
    );
  }
}
