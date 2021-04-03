import 'dart:async';

import 'package:flutter/material.dart';

class StopwatchWidget extends StatefulWidget {
  StopwatchWidget();

  @override
  createState() => _StopwatchWidgetState();
}

class _StopwatchWidgetState extends State<StopwatchWidget> {
  Stopwatch stopwatch = Stopwatch();
  late Timer timer;
  String time = "00:00:00";

  @override
  void initState() {
    super.initState();
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  void startTimer() {
    stopwatch.start();
    timer = Timer.periodic(
      Duration(seconds: 1),
      (timer) => setState(() {
        time = formatDuration(stopwatch.elapsed);
      }),
    );
  }

  void stopTimer() {
    stopwatch.stop();
    timer.cancel();
  }

  void resetTimer() {
    stopwatch.reset();
    timer.cancel();
    setState(() {
      time = stopwatch.elapsed.inSeconds.toString();
    });
  }

  Widget makeButton(String text, VoidCallback onPressed) {
    return RawMaterialButton(
      fillColor: Colors.deepOrange,
      splashColor: Colors.orange,
      shape: const StadiumBorder(),
      onPressed: onPressed,
      child: Text(text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blue.shade100,
      ),
      child: Column(
        children: [
          Text(
            time,
            style: TextStyle(
              fontSize: 40,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              makeButton("Start", () => startTimer()),
              makeButton("Stop", () => stopTimer()),
              makeButton("Reset", () => resetTimer()),
            ],
          )
        ],
      ),
    );
  }
}
