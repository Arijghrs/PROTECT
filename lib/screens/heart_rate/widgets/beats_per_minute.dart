import 'package:flutter/material.dart';
import 'package:protect/data/data_repo.dart';


class BeatsPerMinute extends StatelessWidget {
  const BeatsPerMinute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
       stream: DataRepo().getBPMStream(),
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          final bpm = "${snapshot.data}".padLeft(3, "0");

          String part1 = "";
          String part2 = "";

          bool stillZeroAtLeft = true;

          for (int i = 0; i < bpm.length; i++) {
            if (stillZeroAtLeft) {
              if (bpm[i] == "0") {
                part1 += "0";
              } else {
                part2 += bpm[i];
                stillZeroAtLeft = false;
              }
            } else {
              part2 += bpm[i];
            }
          }

          return Column(
            children: [
              RichText(
                  text: TextSpan(
                      style: const TextStyle(
                          fontSize: 45,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500),
                      text: part1,
                      children: [
                    TextSpan(
                      text: part2,
                      style: const TextStyle(color: Colors.black),
                    )
                  ])),
              const Text(
                "beats per minute",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400),
              )
            ],
          );
        }

        return SizedBox.fromSize();
      },
    );
  }
}
